import game.PlayingField;
import gridAnalysis.Analyser;

import java.io.IOException;
import java.util.Scanner;


public class Game2048TP {

	public static void main(String[] args) throws IOException {

		double res;
		String str;
		Analyser firstAnalyser;
		int previousQuality;
		String previousMove;
		
		double pbU=25;
		double pbL=pbU+25;
		double pbD=pbL+25;
		double pbR=pbD+25;
		int won=-1;
		for (int i = 0; i < 10; i++) {
				
			
			PlayingField pf = new PlayingField(4,4);
			pf.initialize(2);
			System.out.println(pf);
			previousMove="nn";
			previousQuality=0;
			while(pf.movesAvailable()){
				firstAnalyser = new Analyser(pf);
				
				res=Math.random()*100;
				System.out.println(res);
			
				// 
				if(firstAnalyser.getQuality()>previousQuality){
					switch (previousMove) {
					case "u":
						pbU+=0.75;
						pbL-=0.25;
						pbD-=0.25;
						pbR-=0.25;
						break;
					case "l" :
						pbU-=0.25;
						pbL+=0.75;
						pbD-=0.25;
						pbR-=0.25;
						break;
					case "d":
						pbU-=0.25;
						pbL-=0.25;
						pbD+=0.75;
						pbR-=0.25;
						break;
					case "r" :
						pbU-=0.25;
						pbL-=0.25;
						pbD+=0.75;
						pbR-=0.25;
						break;
					default:
						break;
					}
				}
				else{
					switch (previousMove) {
					case "u":
						pbU-=0.75;
						pbL+=0.25;
						pbD+=0.25;
						pbR+=0.25;
						break;
					case "l" :
						pbU+=0.25;
						pbL-=0.75;
						pbD+=0.25;
						pbR+=0.25;
						break;
					case "d":
						pbU+=0.25;
						pbL+=0.25;
						pbD-=0.75;
						pbR+=0.25;
						break;
					case "r" :
						pbU+=0.25;
						pbL+=0.25;
						pbD-=0.75;
						pbR+=0.25;
						break;
					default:
						break;
					}
				}
				
				
				if(res<pbU)
					str="u";
				else if(res<pbL)
					str="l";
				else if(res<pbD)
					str="d";
				else
					str="r";
				
				
				System.out.println("-----------------PROBA");
				System.out.println("U : " + pbU);
				System.out.println("L : " + pbL);
				System.out.println("D : " + pbD);
				System.out.println("R : " + pbR);
				
				System.out.println(str);
				int moved = pf.moveByString(str);
		        if(moved>0) pf.insertRandCell();
		        System.out.println("-------------------------");
		        System.out.println(pf.maxValue().getValue());
		        for (game.Tuple<Integer,Integer> resr : pf.maxValue().getPositions()) {
		        	System.out.println(resr.x);
		        	System.out.println(resr.y);
					
				}
		        
		        // Sauvegarde de l'état
		        previousMove=str;
		        previousQuality=firstAnalyser.getQuality();
		        System.out.println("This is my quality " +firstAnalyser.getQuality());
		        System.out.println(pf);
			}
			if(pf.isGameWon())
				won=i;
			
			System.out.println(pf);
		}
		System.out.println(won);
	}
	
}
