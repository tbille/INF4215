package game;

import java.io.ObjectInputStream.GetField;
import java.util.ArrayList;

public class Case {
	
	private int value;
	private ArrayList<Tuple> positions;
	
	public Case(){
		positions=new ArrayList<>();
	}
	
	public Case(int _value){
		positions=new ArrayList<>();
		value=_value;
	}
	
	public void changeValue(int _newVal, Tuple _pos){
		value=_newVal;
		positions=new ArrayList<>();
		positions.add(_pos);
	}
	
	public void addPosition(Tuple _pos){
		positions.add(_pos);
	}
	
	public ArrayList<Tuple> getPositions(){
		return this.positions;
	}
	
	public int getValue(){
		return value;
	}
	
}
