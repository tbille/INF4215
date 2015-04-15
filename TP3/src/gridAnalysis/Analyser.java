package gridAnalysis;

import game.PlayingField;

public class Analyser {
	
	private PlayingField pf;
	private int Quality;
	
	private int maxValue;
	
	public Analyser(PlayingField _pf) {
		pf = _pf;
		maxValue = pf.maxValue();
	}
	
	private void checkPosition(){
		//Max Value in the Bottom-Left cell
	}
	
	private void checkLastRow(){
		//Consecutive Values in the last row
	} 
	
	private void checkToBeUsed(){
		//Two adjacent cells with the same values
	}
	
	private void checkIsolated(){
		//Value that can not be used easily
	}
	
}