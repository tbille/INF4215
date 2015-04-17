package gridAnalysis;

public class EvalState {
	public double getCprob_thresh() {
		return cprob_thresh;
	}
	public void setCprob_thresh(double cprob_thresh) {
		this.cprob_thresh = cprob_thresh;
	}
	public int getMaxdepth() {
		return maxdepth;
	}
	public void setMaxdepth(int maxdepth) {
		this.maxdepth = maxdepth;
	}
	public int getCurdepth() {
		return curdepth;
	}
	public void setCurdepth(int curdepth) {
		this.curdepth = curdepth;
	}
	public int getCachehits() {
		return cachehits;
	}
	public void setCachehits(int cachehits) {
		this.cachehits = cachehits;
	}
	public int getMoves_evaled() {
		return moves_evaled;
	}
	public void setMoves_evaled(int moves_evaled) {
		this.moves_evaled = moves_evaled;
	}

	//std::map<board_t, float> trans_table; // transposition table, to cache previously-seen moves
	private double cprob_thresh;
    private int maxdepth;
    private int curdepth;
    private int cachehits;
    private int moves_evaled;
	
	public EvalState() {
		cprob_thresh = 0;
		maxdepth = 0;
		curdepth = 0;
		cachehits = 0;
		moves_evaled = 0;
	}
}
