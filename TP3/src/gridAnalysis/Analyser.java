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

		checkMaxCorner(); 
		checkLastLineFull();
		lastLineSum();
		//checkLastColumnFull();
		lastColumnSum();
		checkToBeUsed();
		checkEmptyTiles();
		
		checkGameWon();
		/*checkTotalValue();
		checkPosition();
		checkLastRow();
		checkRowMaxCorner();*/ 
	}
	
	private void checkGameWon(){
		if(pf.isGameWon()){
			quality+=10000;
		}
		else{
			if(!pf.movesAvailable()){
				quality=0;
			}
			else{
				quality+=100;
			}
		}
	}
	
	private void checkSum(){
		
	}
	
	private void checkEmptyTiles(){
		quality+=pf.getNumberOfFreeCells()*50;
	}
	
	private void checkLastLineFull(){
		boolean myres=true;
		for (int i = 0; i < 3; i++) {
			if(pf.getValue(3,i) == 0) {
				myres=false;
			}
		}
		if (myres) {
			quality+=200;
		}
	}
	
	/**
	 * Compare last row sum to other rows sum and update quality
	 */
	private void lastLineSum(){
		int sumLast=0;
		boolean test=true;
		for (int i = 0; i < 4; i++) {
			sumLast+=pf.getValue(3, i);
		}
		int sumL;
		for (int i = 0; i < 3; i++) {
			sumL=0;
			for (int j = 0; j < 4; j++) {
				sumLast+=pf.getValue(i, j);
			}
			
			if(sumL>sumLast){
				quality-=100;
				test=false;
			}
		}
		//if(test){
		//	quality+=100;
		//}
		
	}
	
	/**
	 * Compare last columns sum to other column sum and update quality
	 */
	private void lastColumnSum(){
		int sumLast=0;
		for (int i = 0; i < 4; i++) {
			sumLast+=pf.getValue(i, 3);
		}
		int sumL;
		for (int i = 0; i < 3; i++) {
			sumL=0;
			for (int j = 0; j < 4; j++) {
				sumLast+=pf.getValue(j, i);
			}
			
			if(sumL>sumLast)
				quality-=100;
		}
		
	}
	
	private void checkMaxCorner() {
		if (maxValue.getValue() >= 8) {
			for (Tuple<Integer, Integer> position : maxValue.getPositions()) {
				//Tuple<Integer, Integer> BR = new Tuple<Integer, Integer>(3, 3);
				if (position.x==3 && position.y==3) {
					quality += 500;
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

	/**
	 * Check if the max value is in the bottom left cell
	 */
	private void checkPosition(){
		for (Tuple<Integer, Integer> positions : maxValue.getPositions()) {
			if (positions.x == 0 && positions.y == 3) {
				quality += 100;
			}
		}
	}

	/**
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
	
	private void checkLastColumnFull(){
		boolean myres=true;
		for (int i = 0; i < 3; i++) {
			if(pf.getValue(i,3) == 0)
				myres=false;
		}
		if (myres) {
			quality+=200;
		}
	} 

	private void checkToBeUsed(){
		for (int i = 0; i < 4; i++) {
			for (int j = 0; j < 4; j++) {
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