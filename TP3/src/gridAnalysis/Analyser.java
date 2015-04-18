package gridAnalysis;

import java.util.ArrayList;

import game.Case;
import game.PlayingField;
import game.Tuple;

public class Analyser {

	private double  CPROB_THRESH_BASE = 0.001f;
	private int CACHE_DEPTH_LIMIT = 4;
		
	private PlayingField pf;
	private int quality = 100;

	private int bestMove;
	
	private Case maxValue;

	public Analyser(PlayingField _pf) {
		pf = _pf;
		maxValue = pf.maxValue();
		bestMove=-1;
	}
	

	public int findBestMove(){
		int move;
		float best=0;
		
		ArrayList<PlayingField> pfNext = pf.getAllNextPossiblePlayingFieldsPF();
	    for(move=0; move<4; move++) {
	        float res = score_toplevel_move(pfNext.get(move),move);
	        if(res > best) {
	            best = res;
	            bestMove = move;
	        }
	    }
	    return bestMove;
	}

	private float score_toplevel_move(PlayingField _pf, int move) {
	    float res;
	    EvalState state = new EvalState();
	
	    if(pf.equals(_pf))
	        res=0;
	    else{
	    	state.setCprob_thresh(CPROB_THRESH_BASE);
	    	res=score_tilechoose_node(state, _pf, 1.0);
	    }

	    return res;
	}
	
}
	
	public float score_helper(board_t board, const float* table) {
	    return table[(board >>  0) & ROW_MASK] +
	           table[(board >> 16) & ROW_MASK] +
	           table[(board >> 32) & ROW_MASK] +
	           table[(board >> 48) & ROW_MASK];
	}

	public float score_heur_board(PlayingField _pf) {
	    return score_helper(          board , heur_score_table) +
	           score_helper(transpose(board), heur_score_table);
	}

	public float score_board(board_t board) {
	    return score_helper(board, score_table);
	}
	
	public float score_tilechoose_node(EvalState _state, PlayingField _newPF, double cprob) {
	    float res = 0;
	    int num_open = 0;
	    
	    /*
	    for(int i=0; i<16; i++) {
	        if(((board >> (4*i)) & 0xf) == 0)
	            num_open++;
	    }*/

	    cprob /=  _newPF.getNumberOfFreeCells();
	    res += score_move_node(_state, board | (((board_t)1) << (4*i)), cprob * 0.9f) * 0.9f;

	    return res / num_open;
	}
	
	float score_move_node(EvalState state, PlayingField _newPF, float cprob) {
	    if(cprob < state.getCprob_thresh() || state.getCurdepth() > 5) {
	        if(state.getCurdepth() > state.getMaxdepth())
	            state.setMaxdepth(state.getCurdepth());
	        return score_heur_board(pf);
	    }

	    if(state.getCurdepth() < CACHE_DEPTH_LIMIT) {
	        const auto &i = state.trans_table.find(board);
	        if(i != state.trans_table.end()) {
	            state.setCachehits(state.getCachehits() + 1);
	            return i->second;
	        }
	    }

	    int move;
	    float best = 0;

	    state.setCurdepth(state.getCurdepth() + 1);
	    for(move=0; move<4; move++) {
	        board_t newboard = execute_move(move, board);
	        state.setMoves_evaled(state.getMoves_evaled() + 1);
	        if(board == newboard)
	            continue;

	        float res = score_tilechoose_node(state, newboard, cprob);
	        if(res > best)
	            best = res;
	    }
	    state.setCurdepth(state.getCurdepth() - 1);

	    if(state.getCurdepth() < CACHE_DEPTH_LIMIT) {
	        state.trans_table[board] = best;
	    }

	    return best;
	}
