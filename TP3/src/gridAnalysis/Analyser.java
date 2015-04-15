package gridAnalysis;

import game.Case;
import game.PlayingField;
import game.Tuple;

public class Analyser {
	
	private PlayingField pf;
	private int quality = 100;
	
	private Case maxValue;
	
	
	public Analyser(PlayingField _pf) {
		pf = _pf;
		maxValue = pf.maxValue();
		
		checkPosition();
		checkLastRow();
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
			if ( pf.getValue(3,i) == pf.getValue(3,i+1)*2 || pf.getValue(3,i) == pf.getValue(3,i+1)) {
				quality += 25*(4-i);
				myres=myres&&true;
			}
			else
				myres=myres&&false;
		}
		if (myres) {
			quality+=100;
		}
	} 
	
	private void checkToBeUsed(){
		//Two adjacent cells with the same values
	}
	
	private void checkIsolated(){
		//Value that can not be used easily
	}
	
	public int getQuality() {
		return quality;
	}
}