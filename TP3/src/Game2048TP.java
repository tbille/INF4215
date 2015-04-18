import game.PlayingField;
import gridAnalysis.Analyser;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;



public class Game2048TP {

	public static void main(String[] args) throws IOException {
		int maxi=0,toto=0;
		double res;
		String str;
		Analyser firstAnalyser;

		int won=-1;
		int movedPrevision ;
		
		ArrayList<String> directions=new ArrayList<>();
		directions.add("u");
		directions.add("l");
		directions.add("d");
		directions.add("r");
		ArrayList<Integer> resQualPrevision;
		int nbWin=0;
		for (int i = 0; i < 100; i++) {


			PlayingField pf = new PlayingField(4,4);
			pf.initialize(2);
			System.out.println(pf);

			PlayingField pf_tmp=null;
			Analyser anal_tmp=null;
			
			while(pf.movesAvailable()){
				//firstAnalyser = new Analyser(pf);
				
				/*
				 * Test des différentes qualité
				 */
				resQualPrevision=new ArrayList<>();
				// ici je toutes les directions possible de la grille
				for (String dir : directions) {
					pf_tmp=new PlayingField(pf.getCopyOfCells());
					
					// Déplacement dans la direction
					movedPrevision = pf_tmp.moveByString(dir);
					System.out.println(movedPrevision);
			        if(movedPrevision>0) pf_tmp.insertRandCell();
				
			        // j'analyse la nouvelle grille
			        anal_tmp = new Analyser(pf_tmp);
			        // si elle est égale alors aucun intéret 
			        if(!pf.equal(pf_tmp))
			        	resQualPrevision.add(anal_tmp.getQuality());
			        else{
			        	resQualPrevision.add(0);
			        }
				}
				
				int k=0;
				Integer max=-1;
				str="";
				ArrayList<String> identiques=new ArrayList<>();
				String tmp_res="";
				
				// Ici à partir de toutes les qualités en prévision je récupère la ou les plus grandes
				for (Integer myInteger : resQualPrevision) {
					System.out.println(directions.get(k) +" : "+ myInteger);
					// je vérifie si jamais elle est pas en double
					if(myInteger.compareTo(max)==0){
						identiques.add(directions.get(k));System.out.println("test");
					}
					// si jamais elle est supérieure
					if(max.compareTo(myInteger)<0){
						// céation nouvelle liste
						identiques=new ArrayList<>();
						identiques.add(directions.get(k));
						max=new Integer(myInteger.intValue());
						tmp_res=directions.get(k);
					}
					k++;	
				}
				
				System.out.println(identiques.size());
				// si toutes à 0 alors je prend une au hasard
				/*if(max.compareTo(new Integer(0))==0){
					str=directions.get(0 + (int)(Math.random() * ((3 - 0) + 1)));
				}
				else{*/
					// si jamais plusieurs directions sont égales je prend au hasard en celles ci, sinon je prend la plus grande 
					if(identiques.size()>1){
						System.out.println("identiques");
						str=identiques.get(0 + (int)(Math.random() * (((identiques.size()-1) - 0) + 1)));
					}
					else
						str=tmp_res;
				//}

				System.out.println("Monvement choisi : " + str);
				
		        // Read the char
				/*Scanner s = new Scanner(System.in);
				String e = s.nextLine();
				*/
				
				

				// Changement de la grille
				int moved = pf.moveByString(str);
		        if(moved>0) pf.insertRandCell();

		        System.out.println("Grille Actuelle");
		        System.out.println(pf);
			}
			// si je gagne je récuprer le résultat
			if(pf.isGameWon()){
				won=i;
				nbWin++;
				System.out.println("Gagné !");
			}

			toto=pf.maxValue().getValue();
			if(toto>=2048 && toto>maxi)
				maxi=toto;
				
		}
		System.out.println("NB Victoires : " +nbWin);
		System.out.println("Max res : " + maxi);
	}

}
