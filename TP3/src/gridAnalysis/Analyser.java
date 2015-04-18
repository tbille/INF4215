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
	