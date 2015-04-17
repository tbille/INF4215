package gridAnalysis;

import game.Case;
import game.PlayingField;
import game.Tuple;

public class Analyser {

	private PlayingField pf;
	private int quality = 100;

	private int bestMove;
	
	private Case maxValue;

	public Analyser(PlayingField _pf) {
		pf = _pf;
		maxValue = pf.maxValue();
		bestMove=-1;
		
		checkTotalValue();
		checkPosition();
		checkLastRow();
		checkRowMaxCorner();
	}
	

	public int findBestMove(){
		int move;
		float best=0;
		
	    for(move=0; move<4; move++) {
	        float res = score_toplevel_move(pf, move);
	        if(res > best) {
	            best = res;
	            bestMove = move;
	        }
	    }
	    return bestMove;
	}
	
	private float score_toplevel_move(PlayingField _newPF, int move) {
	    float res;
	    //eval_state state;
	    //state.depth_limit = std::max(3, count_distinct_tiles(board) - 2);
	    
	    if(_newPF.equals(pf))
	      res = 0;
	    else
	      score_tilechoose_node(state, newboard, 1.0f) + 1e-6;

	    return res;
	}
	
	private float score_tilechoose_node(eval_state &state, board_t board, float cprob) {
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	private void checkRowMaxCorner() {
		if (maxValue.getValue() >= 8) {
			for (Tuple<Integer, Integer> position : maxValue.getPositions()) {
				Tuple<Integer, Integer> TL = new Tuple<Integer, Integer>(0, 0);
				Tuple<Integer, Integer> BR = new Tuple<Integer, Integer>(3, 3);
				Tuple<Integer, Integer> TR = new Tuple<Integer, Integer>(0, 3);
				Tuple<Integer, Integer> BL = new Tuple<Integer, Integer>(3, 0);
				if (position == TL || position == BL || position == TR || position == BR) {
					quality += 250;
				}
			}
		}
	}

	/**
	 * Check the max value
	 */
	private void checkTotalValue(){
		quality+=pf.sumAll();
	}

	/*
	 * Check if the max value is in the bottom left cell
	 */
	private void checkPosition(){
		for (Tuple<Integer, Integer> positions : maxValue.getPositions()) {
			if (positions.x == 0 && positions.y == 3) {
				quality += 100;
			}
		}
	}

	/*
	 * Check if there is consecutive values in the last row
	 */
	private void checkLastRow(){
		boolean myres=true;
		for (int i = 0; i < 3; i++) {
			if(pf.getValue(3,i) == 0) {
				if ( pf.getValue(3,i) == pf.getValue(3,i+1)*2 || pf.getValue(3,i) == pf.getValue(3,i+1)) {
					quality += 25*(4-i);
					myres=myres&&true;
				}
				else
					myres=myres&&false;
			}
		}
		if (myres) {
			quality+=100;
		}
	} 

	private void checkToBeUsed(){
		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 3; j++) {
				quality = (checkNeighborVEquals(i,j)) ? quality+50 : quality;
				quality = (checkNeighborHEquals(i,j)) ? quality+50 : quality;
			}
		}
	}

	/**
	 *  Check values that cannot be used easily
	 */
	private void checkIsolated(){
		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 3; j++) {
				quality = (checkNeighborV(i,j)) ? quality-20 : quality;
				quality = (checkNeighborH(i,j)) ? quality-20 : quality;
			}
		}
	}

	private boolean checkNeighborV(int _x, int _y){
		boolean res = false;
		int value = pf.getValue(_x, _y);
		
		if (value>4) {
			
			// - Premiere Ligne
			if (_x == 0) {
				int valueUnder = pf.getValue(_x+1,_y);
				res = (valueUnder < value/2) ? true : false;
			}
			// - Derniere Ligne
			else if (_x == 3) {
				int valueOver = pf.getValue(_x-1,_y);
				res = (valueOver < value/2) ? true : false;

			}
			else {
				int valueOver = pf.getValue(_x-1,_y);
				int valueUnder = pf.getValue(_x+1,_y);

				res = (valueOver < value/2) ? true : false;
				res = (valueUnder < value/2) ? true : false;
			}
		}
		return res;
	}

	private boolean checkNeighborH(int _x, int _y){
		boolean res=false;
		int value = pf.getValue(_x, _y);
		
		if (value>4) {
			
			// - Premiere Ligne
			if (_y == 0) {
				int valueUnder = pf.getValue(_x,_y+1);
				res = (valueUnder < value/2) ? true : false;
			}
			// - Derniere Ligne
			else if (_y == 3) {
				int valueOver = pf.getValue(_x,_y-1);
				res = (valueOver < value/2) ? true : false;
			}
			else {
				int valueOver = pf.getValue(_x,_y-1);
				int valueUnder = pf.getValue(_x,_y+1);

				res = (valueOver < value/2) ? true : false;
				res = (valueUnder < value/2) ? true : false;
			}
		}
		return res;
	}

	private boolean checkNeighborVEquals(int _x, int _y){
		boolean res = false;
		int value = pf.getValue(_x, _y);
		
		if (value>4) {
			
			// - Premiere Ligne
			if (_x == 0) {
				int valueUnder = pf.getValue(_x+1,_y);
				res = (valueUnder == value) ? true : false;
			}
			// - Derniere Ligne
			else if (_x == 3) {
				int valueOver = pf.getValue(_x-1,_y);
				res = (valueOver == value) ? true : false;

			}
			else {
				int valueOver = pf.getValue(_x-1,_y);
				int valueUnder = pf.getValue(_x+1,_y);

				res = (valueOver == value) ? true : false;
				res = (valueUnder == value) ? true : false;
			}
		}
		return res;
	}

	private boolean checkNeighborHEquals(int _x, int _y){
		boolean res=false;
		int value = pf.getValue(_x, _y);
		
		if (value>4) {
			
			// - Premiere Ligne
			if (_y == 0) {
				int valueUnder = pf.getValue(_x,_y+1);
				res = (valueUnder == value) ? true : false;
			}
			// - Derniere Ligne
			else if (_y == 3) {
				int valueOver = pf.getValue(_x,_y-1);
				res = (valueOver == value) ? true : false;
			}
			else {
				int valueOver = pf.getValue(_x,_y-1);
				int valueUnder = pf.getValue(_x,_y+1);

				res = (valueOver == value) ? true : false;
				res = (valueUnder == value) ? true : false;
			}
		}
		return res;
	}

	/**
	 * 
	 * @return
	 */
	public int getQuality() {
		return quality;
	}
}