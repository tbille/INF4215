#include <ctype.h>
#include <math.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <algorithm>

#include "2048.h"

#include "config.h"
#if defined(HAVE_UNORDERED_MAP)
    #include <unordered_map>
    typedef std::unordered_map<board_t, float> trans_table_t;
#elif defined(HAVE_TR1_UNORDERED_MAP)
    #include <tr1/unordered_map>
    typedef std::tr1::unordered_map<board_t, float> trans_table_t;
#else
    #include <map>
    typedef std::map<board_t, float> trans_table_t;
#endif

/* MSVC compatibility: undefine max and min macros */
#if defined(max)
#undef max
#endif

#if defined(min)
#undef min
#endif

// Transpose rows/columns in a board:
//   0123       048c
//   4567  -->  159d
//   89ab       26ae
//   cdef       37bf
static inline board_t transpose(board_t x)
{
  board_t a1 = x & 0xF0F00F0FF0F00F0FULL;
  board_t a2 = x & 0x0000F0F00000F0F0ULL;
  board_t a3 = x & 0x0F0F00000F0F0000ULL;
  board_t a = a1 | (a2 << 12) | (a3 >> 12);
  board_t b1 = a & 0xFF00FF0000FF00FFULL;
  board_t b2 = a & 0x00FF00FF00000000ULL;
  board_t b3 = a & 0x00000000FF00FF00ULL;
  return b1 | (b2 >> 24) | (b3 << 24);
}


/* We can perform state lookups one row at a time by using arrays with 65536 entries. */

/* Move tables. Each row or compressed column is mapped to (oldrow^newrow) assuming row/col 0.
 *
 * Thus, the value is 0 if there is no move, and otherwise equals a value that can easily be
 * xor'ed into the current board state to update the board. */
static row_t row_left_table [65536];
static row_t row_right_table[65536];
static board_t col_up_table[65536];
static board_t col_down_table[65536];
static float heur_score_table[65536];
static float score_table[65536];

// Heuristic scoring settings
static const float SCORE_LOST_PENALTY = 200000.0f;
static const float SCORE_MONOTONICITY_POWER = 4.0f;
static const float SCORE_MONOTONICITY_WEIGHT = 47.0f;
static const float SCORE_SUM_POWER = 3.5f;
static const float SCORE_SUM_WEIGHT = 11.0f;
static const float SCORE_MERGES_WEIGHT = 700.0f;
static const float SCORE_EMPTY_WEIGHT = 270.0f;


static inline int get_max_rank(board_t board) {
    int maxrank = 0;
    while (board) {
        maxrank = std::max(maxrank, int(board & 0xf));
        board >>= 4;
    }
    return maxrank;
}

static inline int count_distinct_tiles(board_t board) {
    uint16_t bitset = 0;
    while (board) {
        bitset |= 1<<(board & 0xf);
        board >>= 4;
    }

    // Don't count empty tiles.
    bitset >>= 1;

    int count = 0;
    while (bitset) {
        bitset &= bitset - 1;
        count++;
    }
    return count;
}

/* Optimizing the game */

struct eval_state {
    trans_table_t trans_table; // transposition table, to cache previously-seen moves
    int maxdepth;
    int curdepth;
    int cachehits;
    unsigned long moves_evaled;
    int depth_limit;

    eval_state() : maxdepth(0), curdepth(0), cachehits(0), moves_evaled(0), depth_limit(0) {
    }
};

// score a single board heuristically
static float score_heur_board(board_t board);
// score a single board actually (adding in the score from spawned 4 tiles)
static float score_board(board_t board);
// score over all possible moves
static float score_move_node(eval_state &state, board_t board, float cprob);
// score over all possible tile choices and placements
static float score_tilechoose_node(eval_state &state, board_t board, float cprob);


static float score_helper(board_t board, const float* table) {
    return table[(board >>  0) & ROW_MASK] +
           table[(board >> 16) & ROW_MASK] +
           table[(board >> 32) & ROW_MASK] +
           table[(board >> 48) & ROW_MASK];
}

static float score_heur_board(board_t board) {
    return score_helper(          board , heur_score_table) +
           score_helper(transpose(board), heur_score_table);
}

static float score_board(board_t board) {
    return score_helper(board, score_table);
}

// Statistics and controls
// cprob: cumulative probability
// don't recurse into a node with a cprob less than this threshold
static const float CPROB_THRESH_BASE = 0.0001f;
static const int CACHE_DEPTH_LIMIT  = 6;

static float score_tilechoose_node(eval_state &state, board_t board, float cprob) {
    if (cprob < CPROB_THRESH_BASE || state.curdepth >= state.depth_limit) {
        state.maxdepth = std::max(state.curdepth, state.maxdepth);
        return score_heur_board(board);
    }

    if (state.curdepth < CACHE_DEPTH_LIMIT) {
        const trans_table_t::iterator &i = state.trans_table.find(board);
        if (i != state.trans_table.end()) {
            state.cachehits++;
            return i->second;
        }
    }

    int num_open = count_empty(board);
    cprob /= num_open;

    float res = 0.0f;
    board_t tmp = board;
    board_t tile_2 = 1;
    while (tile_2) {
        if ((tmp & 0xf) == 0) {
            res += score_move_node(state, board |  tile_2      , cprob * 0.9f) * 0.9f;
            res += score_move_node(state, board | (tile_2 << 1), cprob * 0.1f) * 0.1f;
        }
        tmp >>= 4;
        tile_2 <<= 4;
    }
    res = res / num_open;

    if (state.curdepth < CACHE_DEPTH_LIMIT) {
        state.trans_table[board] = res;
    }

    return res;
}

static float score_move_node(eval_state &state, board_t board, float cprob) {
    float best = 0.0f;
    state.curdepth++;
    for (int move = 0; move < 4; ++move) {
        board_t newboard = execute_move(move, board);
        state.moves_evaled++;

        if (board != newboard) {
            best = std::max(best, score_tilechoose_node(state, newboard, cprob));
        }
    }
    state.curdepth--;

    return best;
}

static float _score_toplevel_move(eval_state &state, board_t board, int move) {
    //int maxrank = get_max_rank(board);
    board_t newboard = execute_move(move, board);

    if(board == newboard)
        return 0;

    return score_tilechoose_node(state, newboard, 1.0f) + 1e-6;
}

float score_toplevel_move(board_t board, int move) {
    float res;
    struct timeval start, finish;
    double elapsed;
    eval_state state;
    state.depth_limit = std::max(3, count_distinct_tiles(board) - 2);

    gettimeofday(&start, NULL);
    res = _score_toplevel_move(state, board, move);
    gettimeofday(&finish, NULL);

    elapsed = (finish.tv_sec - start.tv_sec);
    elapsed += (finish.tv_usec - start.tv_usec) / 1000000.0;

    printf("Move %d: result %f: eval'd %ld moves (%d cache hits, %d cache size) in %.2f seconds (maxdepth=%d)\n", move, res,
        state.moves_evaled, state.cachehits, (int)state.trans_table.size(), elapsed, state.maxdepth);

    return res;
}

/* Find the best move for a given board. */
int find_best_move(board_t board) {
    int move;
    float best = 0;
    int bestmove = -1;

    print_board(board);
    printf("Current scores: heur %.0f, actual %.0f\n", score_heur_board(board), score_board(board));

    for(move=0; move<4; move++) {
        float res = score_toplevel_move(board, move);

        if(res > best) {
            best = res;
            bestmove = move;
        }
    }

    return bestmove;
}

int ask_for_move(board_t board) {
    int move;
    char validstr[5];
    char *validpos = validstr;

    print_board(board);

    for(move=0; move<4; move++) {
        if(execute_move(move, board) != board)
            *validpos++ = "UDLR"[move];
    }
    *validpos = 0;
    if(validpos == validstr)
        return -1;

    while(1) {
        char movestr[64];
        const char *allmoves = "UDLR";

        printf("Move [%s]? ", validstr);

        if(!fgets(movestr, sizeof(movestr)-1, stdin))
            return -1;

        if(!strchr(validstr, toupper(movestr[0]))) {
            printf("Invalid move.\n");
            continue;
        }

        return strchr(allmoves, toupper(movestr[0])) - allmoves;
    }
}

/* Playing the game */
static board_t draw_tile() {
    return (unif_random(10) < 9) ? 1 : 2;
}

static board_t insert_tile_rand(board_t board, board_t tile) {
    int index = unif_random(count_empty(board));
    board_t tmp = board;
    while (true) {
        while ((tmp & 0xf) != 0) {
            tmp >>= 4;
            tile <<= 4;
        }
        if (index == 0) break;
        --index;
        tmp >>= 4;
        tile <<= 4;
    }
    return board | tile;
}

static board_t initial_board() {
    board_t board = draw_tile() << (4 * unif_random(16));
    return insert_tile_rand(board, draw_tile());
}

void play_game(get_move_func_t get_move) {
    board_t board = initial_board();
    int moveno = 0;
    int scorepenalty = 0; // "penalty" for obtaining free 4 tiles

    while(1) {
        int move;
        board_t newboard;

        for(move = 0; move < 4; move++) {
            if(execute_move(move, board) != board)
                break;
        }
        if(move == 4)
            break; // no legal moves

        printf("\nMove #%d, current score=%.0f\n", ++moveno, score_board(board) - scorepenalty);

        move = get_move(board);
        if(move < 0)
            break;

        newboard = execute_move(move, board);
        if(newboard == board) {
            printf("Illegal move!\n");
            moveno--;
            continue;
        }

        board_t tile = draw_tile();
        if (tile == 2) scorepenalty += 4;
        board = insert_tile_rand(newboard, tile);
    }

    print_board(board);
    printf("\nGame over. Your score is %.0f. The highest rank you achieved was %d.\n", score_board(board) - scorepenalty, get_max_rank(board));
}

int main() {
    init_tables();
    play_game(find_best_move);
}
