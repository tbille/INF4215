package game;

import java.io.ObjectInputStream.GetField;
import java.util.ArrayList;

/**
 * Classe qui me permet de sauvegarder une valeur et de garder toutes ses positions 
 * @author tbille
 *
 */
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
	
	/**
	 * Permet de changer la la valeur de value et de réinitialiser le tableau des positions avec la position de la valeur
	 * @param _newVal
	 * @param _pos
	 */
	public void changeValue(int _newVal, Tuple _pos){
		value=_newVal;
		positions=new ArrayList<>();
		positions.add(_pos);
	}
	
	/**
	 * Permet d'ajouter une position dans le tableau des positions
	 * @param _pos
	 */
	public void addPosition(Tuple _pos){
		positions.add(_pos);
	}
	
	/**
	 * Permet de récupérer la liste des positions
	 * @return
	 */
	public ArrayList<Tuple> getPositions(){
		return this.positions;
	}
	
	/**
	 * Permet de récupérer la valeur
	 * @return
	 */
	public int getValue(){
		return value;
	}
	
}
