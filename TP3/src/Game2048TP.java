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

		double pbU=15;
		double pbL=35;
		double pbD=35;
		double pbR=15;
		int won=-1;
		for (int i = 0; i < 10; i++) {


			PlayingField pf = new PlayingField(4,4);
			pf.initialize(2);
			System.out.println(pf);
			previousMove="nn";
			previousQuality=0;
			double pb_tmp;
			while(pf.movesAvailable()){
				firstAnalyser = new Analyser(pf);

				res=Math.random()*100;
				System.out.println(res);

				//
				if(firstAnalyser.getQuality()>previousQuality){
					switch (previousMove) {
					case "u":
						pb_tmp=pbU;
						pbU*=1.1;
						pb_tmp=(pbU-pb_tmp)/3;
						pbL-=pb_tmp;
						pbD-=pb_tmp;
						pbR-=pb_tmp;
						break;
					case "l" :
						pb_tmp=pbL;
						pbL*=1.1;
						pb_tmp=(pbL-pb_tmp)/3;
						pbU-=pb_tmp;
						pbD-=pb_tmp;
						pbR-=pb_tmp;
						break;
					case "d":
						pb_tmp=pbD;
						pbD*=1.1;
						pb_tmp=(pbD-pb_tmp)/3;
						pbU-=pb_tmp;
						pbL-=pb_tmp;
						pbR-=pb_tmp;
						break;
					case "r" :
						pb_tmp=pbR;
						pbR*=1.1;
						pb_tmp=(pbR-pb_tmp)/3;
						pbU-=pb_tmp;
						pbL-=pb_tmp;
						pbD-=pb_tmp;
						break;
					default:
						break;
					}
				}
				else{
					switch (previousMove) {
						case "u":
							pb_tmp=pbU;
							pbU*=0.90;
							pb_tmp=(pbU-pb_tmp)/3;
							pbL-=pb_tmp;
							pbD-=pb_tmp;
							pbR-=pb_tmp;
							break;
						case "l" :
							pb_tmp=pbL;
							pbL*=0.90;
							pb_tmp=(pbL-pb_tmp)/3;
							pbU-=pb_tmp;
							pbD-=pb_tmp;
							pbR-=pb_tmp;
							break;
						case "d":
							pb_tmp=pbD;
							pbD*=0.90;
							pb_tmp=(pbD-pb_tmp)/3;
							pbU-=pb_tmp;
							pbL-=pb_tmp;
							pbR-=pb_tmp;
							break;
						case "r" :
							pb_tmp=pbR;
							pbR*=0.90;
							pb_tmp=(pbR-pb_tmp)/3;
							pbU-=pb_tmp;
							pbL-=pb_tmp;
							pbD-=pb_tmp;
							break;
						default:
							break;
					}
				}


				if(res<pbU)
					str="u";
				else if(res<pbU+pbL)
					str="l";
				else if(res<pbU+pbL+pbD)
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
