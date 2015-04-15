import game.PlayingField;

import java.io.IOException;
import java.util.Scanner;


public class Game2048TP {

	public static void main(String[] args) throws IOException {
		PlayingField pf = new PlayingField(4,4);
		pf.initialize(2);
		System.out.println(pf);
		double res;
		String str;
		while(pf.movesAvailable()){

			res=Math.random()*100;
			System.out.println(res);
			if(res<25)
				str="u";
			else if(res<50)
				str="l";
			else if(res<75)
				str="d";
			else
				str="r";
			System.out.println(str);
			int moved = pf.moveByString(str);
	        if(moved>0) pf.insertRandCell();
	        System.out.println(pf);
		}
		System.out.println(pf);
	}
	
}
