
%-------------------------------------------
%
%   Asks
%
%-------------------------------------------

ask(vivant):-
	format("Votre personnage est-il vivant ? "),
	read(Reponse),
	Reponse = oui.

ask(homme):-
	format("Votre personnage est-il un personnage masculin ? "),
	read(Reponse),
	Reponse = oui.

ask(fictif):-
	format("Votre personnage est-il un personnage fictif ? "),
	read(Reponse),
	Reponse = oui.

ask(source,Source):-
	format("Votre personnage provient-il d'un(e) ~w ? ",[Source]),
	read(Reponse),
	Reponse = oui.

ask(metier,Metier):-
	format("Votre personnage est-il un(e) ~w ? ",[Metier]),
	read(Reponse),
	Reponse = oui.

ask(gouverne,Pays):-
	format("Votre personnage a-t-il(elle) gouverné ~w ? ",[Pays]),
	read(Reponse),
	Reponse = oui.

ask(style,Style):-
	format("Votre personnage est-il un musicien de ~w ? ",[Style]),
	read(Reponse),
	Reponse = oui.

ask(livre,Livre):-
	format("Votre personnage a-t-il écrit ~w ? ",[Livre]),
	read(Reponse),
	Reponse = oui.

ask(sport,Sport):-
	format("Votre personnage pratique-t-il le(la) ~w ? ",[Sport]),
	read(Reponse),
	Reponse = oui.

ask(domaine,Domaine):-
	format("Votre personnage enseigne-t-il ~w ? ",[Domaine]),
	read(Reponse),
	Reponse = oui.

ask(eau,Action):-
	format("Votre personnage a-t-il ~w l'eau ? ",[Action]),
	read(Reponse),
	Reponse = oui.


%-------------------------------------------
%
%   Recherche Personne
%
%-------------------------------------------

personne(X):-
	ask(vivant),!,
	genreQ(X),
	prop(X,vivant).

personne(X):-
	genreQ(X),
	prop(X,mort).

genreQ(X):-
	ask(homme),!,
	reelQ(X),
	prop(X,masculin).

genreQ(X):-
	reelQ(X),
	prop(X,feminin).
	
reelQ(X):-
	ask(fictif),!,
	fictif(X),
	prop(X,fictif).

reelQ(X):-
	reelPerso(X),
	prop(X,reel).

reelPerso(X):-
	metierQ(X).

fictif(X):-
	source(Y),
	ask(source,Y),!,
  metierQ(X),
	prop(X,Y).

metierQ(X):-
	metier(Y),
	ask(metier,Y),!,
	reste(X,Y),
	prop(X,Y).

reste(X,Y):-
	Y = politicien,
	gouverne(Pays),
	ask(gouverne,Pays),!,
	prop(X,Pays).

reste(X,Y):-
	Y = musicien,
	style(Style),
	ask(style,Style),!,
	prop(X,Style).

reste(X,Y):-
	Y = auteur,
	livre(Livre),
	ask(livre,Livre),!,
	prop(X,Livre).

reste(X,Y):-
	Y = sportif,
	sport(Sport),
	ask(sport,Sport),!,
	prop(X,Sport).

reste(X,Y):-
	Y = professeur,
	domaine(Domaine),
	ask(domaine,Domaine),!,
	prop(X,Domaine).

reste(X,Y):-
	Y = religieux,
	eau(Action),
	ask(eau,Action),!,
	prop(X,Action).

reste(_,Y):-
	Y = religieux.

reste(_,_).


%-------------------------------------------
%
%   Personnes
%
%-------------------------------------------

personnes(michael_Jackson).
personnes(wolfgang_Amadeus_Mozart).
personnes(john_Lewis).
personnes(stephen_Harper).
personnes(cleopatre_VII).
personnes(brad_Pitt).
personnes(julie_Snyder).
personnes(michel_Gagnon).
personnes(michel_Dagenais).
personnes(lara_croft).
personnes(mario).
personnes(garfield).
personnes(james_Bond).
personnes(blanche_neige).
personnes(jacques_Villeneuve).
personnes(rafael_Nadal).
personnes(eugenie_Bouchard).
personnes(victor_Hugo).
personnes(j_K_Rowling).
personnes(pape_Francois).
personnes(moise).
personnes(jesus).

personnes(bill_Gates).
personnes(grumpy_Cat).
personnes(socrate).
personnes(jules_Cesar).
personnes(isaac_Newton).
personnes(samuel_de_Champlain).
personnes(richard_Nixon).
personnes(shrek).
personnes(napoleon_Bonaparte).
personnes(lady_Gaga).
personnes(dracula).
personnes(jack_Sparrow).
personnes(georges_Lucas).
personnes(simba).
personnes(harry_Potter).
personnes(michel_Therrien).
personnes(pierre_Bruneau).
personnes(michael_Phelps).
personnes(carey_Price).

prop(carey_Price,masculin).
prop(carey_Price,vivant).
prop(carey_Price,reel).
prop(carey_Price,sportif).
prop(carey_Price,hockey).
prop(michael_Phelps,masculin).
prop(michael_Phelps,vivant).
prop(michael_Phelps,reel).
prop(michael_Phelps,sportif).
prop(michael_Phelps,natation).
prop(pierre_Bruneau,vivant).
prop(pierre_Bruneau,masculin).
prop(pierre_Bruneau,reel).
prop(pierre_Bruneau,animateur).
prop(michel_Therrien,vivant).
prop(michel_Therrien,masculin).
prop(michel_Therrien,entraineur).
prop(grumpy_Cat,vivant).
prop(grumpy_Cat,masculin).
prop(grumpy_Cat,reel).
prop(grumpy_Cat,chat).
prop(bill_Gates,vivant).
prop(bill_Gates,masculin).
prop(bill_Gates,reel).
prop(bill_Gates,informaticien).
prop(socrate,mort).
prop(socrate,masculin).
prop(socrate,reel).
prop(socrate,philosophe).
prop(jules_Cesar,mort).
prop(jules_Cesar,masculin).
prop(jules_Cesar,reel).
prop(jules_Cesar,politicien).
prop(jules_Cesar,rome_antique).
prop(isaac_Newton,mort).
prop(isaac_Newton,masculin).
prop(isaac_Newton,reel).
prop(isaac_Newton,scientifique).
prop(samuel_de_Champlain,mort).
prop(samuel_de_Champlain,masculin).
prop(samuel_de_Champlain,reel).
prop(samuel_de_Champlain,explorateur).
prop(richard_Nixon,mort).
prop(richard_Nixon,masculin).
prop(richard_Nixon,reel).
prop(richard_Nixon,politicien).
prop(richard_Nixon,usa).
prop(shrek,vivant).
prop(shrek,fictif).
prop(shrek,masculin).
prop(shrek,ogre).
prop(napoleon_Bonaparte,vivant).
prop(napoleon_Bonaparte,reel).
prop(napoleon_Bonaparte,masculin).
prop(napoleon_Bonaparte,politicien).
prop(napoleon_Bonaparte,empire_Francais).
prop(lady_Gaga,vivant).
prop(lady_Gaga,feminin).
prop(lady_Gaga,reel).
prop(lady_Gaga,musicien).
prop(lady_Gaga,pop).
prop(dracula,vivant).
prop(dracula,masculin).
prop(dracula,fictif).
prop(dracula,vampire).
prop(jack_Sparrow,vivant).
prop(jack_Sparrow,masculin).
prop(jack_Sparrow,fictif).
prop(jack_Sparrow,pirate).
prop(georges_Lucas,vivant).
prop(georges_Lucas,masculin).
prop(georges_Lucas,reel).
prop(georges_Lucas,realisateur).
prop(simba,vivant).
prop(simba,masculin).
prop(simba,fictif).
prop(simba,lion).
prop(harry_Potter,vivant).
prop(harry_Potter,masculin).
prop(harry_Potter,fictif).
prop(harry_Potter,sorcier).





%-------------------------------------------
%
%   Props
%
%-------------------------------------------

prop(michael_Jackson,musicien).
prop(michael_Jackson,masculin).
prop(michael_Jackson,pop).
prop(michael_Jackson,reel).
prop(michael_Jackson,mort).
prop(wolfgang_Amadeus_Mozart,musicien).
prop(wolfgang_Amadeus_Mozart,masculin).
prop(wolfgang_Amadeus_Mozart,classique).
prop(wolfgang_Amadeus_Mozart,reel).
prop(wolfgang_Amadeus_Mozart,mort).
prop(john_Lewis,musicien).
prop(john_Lewis,masculin).
prop(john_Lewis,jazz).
prop(john_Lewis,reel).
prop(john_Lewis,mort).
prop(stephen_Harper,politicien).
prop(stephen_Harper,masculin).
prop(stephen_Harper,vivant).
prop(stephen_Harper,reel).
prop(stephen_Harper,le_Canada).
prop(cleopatre_VII,politicien).
prop(cleopatre_VII,feminin).
prop(cleopatre_VII,mort).
prop(cleopatre_VII,reel).
prop(cleopatre_VII,l_Egypte_ancienne).
prop(brad_Pitt,acteur).
prop(brad_Pitt,masculin).
prop(brad_Pitt,reel).
prop(brad_Pitt,vivant).
prop(julie_Snyder,acteur).
prop(julie_Snyder,feminin).
prop(julie_Snyder,reel).
prop(julie_Snyder,vivant).
prop(michel_Gagnon,professeur).
prop(michel_Gagnon,masculin).
prop(michel_Gagnon,vivant).
prop(michel_Gagnon,reel).
prop(michel_Gagnon,l_ia).
prop(michel_Dagenais,professeur).
prop(michel_Dagenais,masculin).
prop(michel_Dagenais,vivant).
prop(michel_Dagenais,reel).
prop(michel_Dagenais,le_logiciel_Libre).
prop(lara_croft,fictif).
prop(lara_croft,feminin).
prop(lara_croft,jeuVideo).
prop(lara_croft,aventurier).
prop(lara_croft,vivant).
prop(mario,fictif).
prop(mario,masculin).
prop(mario,jeuVideo).
prop(mario,plombier).
prop(mario,vivant).
prop(garfield,chat).
prop(garfield,fictif).
prop(garfield,masculin).
prop(garfield,bd).
prop(garfield,vivant).
prop(james_Bond,film).
prop(james_Bond,fictif).
prop(james_Bond,masculin).
prop(james_Bond,espion).
prop(james_Bond,vivant).
prop(blanche_neige,feminin).
prop(blanche_neige,fictif).
prop(blanche_neige,film).
prop(blanche_neige,princesse).
prop(blanche_neige,vivant).
prop(jacques_Villeneuve,f1).
prop(jacques_Villeneuve,masculin).
prop(jacques_Villeneuve,reel).
prop(jacques_Villeneuve,sportif).
prop(jacques_Villeneuve,vivant).
prop(rafael_Nadal,tennis).
prop(rafael_Nadal,masculin).
prop(rafael_Nadal,reel).
prop(rafael_Nadal,sportif).
prop(rafael_Nadal,vivant).
prop(eugenie_Bouchard,sportif).
prop(eugenie_Bouchard,feminin).
prop(eugenie_Bouchard,reel).
prop(eugenie_Bouchard,tennis).
prop(eugenie_Bouchard,vivant).
prop(victor_Hugo,auteur).
prop(victor_Hugo,mort).
prop(victor_Hugo,masculin).
prop(victor_Hugo,reel).
prop(victor_Hugo,les_Miserables).
prop(j_K_Rowling,auteur).
prop(j_K_Rowling,vivant).
prop(j_K_Rowling,feminin).
prop(j_K_Rowling,reel).
prop(j_K_Rowling,harry_Potter).
prop(pape_Francois,religieux).
prop(pape_Francois,masculin).
prop(pape_Francois,reel).
prop(pape_Francois,vivant).
prop(moise,religieux).
prop(moise,masculin).
prop(moise,separer).
prop(moise,reel).
prop(moise,mort).
prop(jesus,religieux).
prop(jesus,masculin).
prop(jesus,marcher_sur).
prop(jesus,reel).
prop(jesus,mort).

%-------------------------------------------
%
%   Attributs
%
%-------------------------------------------

livre(harry_Potter).
livre(les_Miserables).

metier(politicien).
metier(chat).
metier(religieux).
metier(auteur).
metier(sportif).
metier(professeur).
metier(acteur).
metier(musicien).
metier(espion).
metier(aventurier).
metier(plombier).
metier(princesse).
metier(sorcier).
metier(lion).
metier(realisateur).
metier(pirate).
metier(vampire).
metier(philosophe).
metier(informaticien).
metier(entraineur).

vie(mort).
vie(vivant).

genre(masculin).
genre(feminin).

style(classique).
style(jazz).
style(pop).

source(jeuVideo).
source(film).
source(bd).

sport(tennis).
sport(f1).
sport(hockey).
sport(natation).

eau(separer).
eau(marcher_sur).

domaine(l_ia).
domaine(le_logiciel_Libre).

gouverne(le_Canada).
gouverne(l_Egypte_ancienne).
gouverne(rome_antique).
gouverne(empire_Francais).
gouverne(usa).