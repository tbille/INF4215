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
		int row[] = {0,0,0,0};
		for (int i = 0; i < 4; i++) {
			row[i] = pf.getValue(3,i);
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