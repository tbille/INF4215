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

		checkMaxValue();
		checkPosition();
		checkLastRow();
	}

	/**
	 * Check the max value
	 */
	private void checkMaxValue(){
		quality+=maxValue.getValue();
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
		//Two adjacent cells with the same values
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

	/**
	 * 
	 * @return
	 */
	public int getQuality() {
		return quality;
	}
}