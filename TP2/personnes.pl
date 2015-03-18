
ask(vivant):-
  format("Votre personnage est-il vivant ?"),
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

ask(source,Y):-
  format("Votre personnage provient-il d'un(e) ~w ?",[Y]),
  read(Reponse),
  Reponse = oui.

ask(metier,Y):-
  format("Votre personnage est-il un(e) ~w ?",[Y]),
  read(Reponse),
  Reponse = oui.

personnes(X):-
  prop(X,vivant),
  ask(vivant),!,
  genreQ(X).

personnes(X):-
  prop(X,mort),!,
  genreQ(X).

genreQ(X):-
  prop(X,masculin),
  ask(homme),!,
  reelQ(X).

genreQ(X):-
  prop(X,feminin),!,
  reelQ(X).

reelQ(X):-
  ask(fictif),!,
  format("--fictif-- "),
  prop(X,fictif),
  format("--assigned-- "),
  fictif(X).

reelQ(X):-
  prop(X,reel),!,
  reelPerso(X).

reelPerso(_).

fictif(X):-
  source(Y),
  ask(source,Y),!,
  metierQ(X).

metierQ(X):-
  metier(Y),
  prop(X,Y),
  ask(metier,Y),!.




%-------------------------------------------
%
%   Personnes
%
%-------------------------------------------

personne(michael_Jackson).
personne(wolfgang_Amadeus_Mozart).
personne(john_Lewis).
personne(stephen_Harper).
personne(cleopatre_VII).
personne(brad_Pitt).
personne(julie_Snyder).
personne(michel_Gagnon).
personne(michel_Dagenais).
personne(lara_croft).
personne(mario).
personne(garfield).
personne(james_Bond).
personne(blanche_neige).
personne(jacques_Villeneuve).
personne(rafael_Nadal).
personne(eugenie_Bouchard).
personne(victor_Hugo).
personne(j_K_Rowling).
personne(pape_Francois).
personne(moise).
personne(jesus).

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
prop(stephen_Harper,canada).
prop(cleopatre_VII,politicien).
prop(cleopatre_VII,feminin).
prop(cleopatre_VII,mort).
prop(cleopatre_VII,reel).
prop(cleopatre_VII,egypte).
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
prop(michel_Gagnon,ia).
prop(michel_Dagenais,professeur).
prop(michel_Dagenais,masculin).
prop(michel_Dagenais,vivant).
prop(michel_Dagenais,reel).
prop(michel_Dagenais,logiciel_Libre).
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
prop(jacques_Villeneuve,f1).
prop(jacques_Villeneuve,masculin).
prop(jacques_Villeneuve,reel).
prop(jacques_Villeneuve,sportif).
prop(rafael_Nadal,tennis).
prop(rafael_Nadal,masculin).
prop(rafael_Nadal,reel).
prop(rafael_Nadal,sportif).
prop(eugenie_Bouchard,sportif).
prop(eugenie_Bouchard,feminin).
prop(eugenie_Bouchard,reel).
prop(eugenie_Bouchard,tennis).
prop(victor_Hugo,auteur).
prop(victor_Hugo,mort).
prop(victor_Hugo,masculin).
prop(victor_Hugo,reel).
prop(victor_Hugo,les_Miserables).
prop(j_K_Rowling, auteur).
prop(j_K_Rowling,vivant).
prop(j_K_Rowling,feminin).
prop(j_K_Rowling,reel).
prop(j_K_Rowling,harry_Potter).
prop(pape_Francois, religieux).
prop(pape_Francois,masculin).
prop(pape_Francois,reel).
prop(pape_Francois,vivant).
prop(moise,religieux).
prop(moise,masculin).
prop(moise,marcher).
prop(moise,reel).
prop(moise,mort).
prop(jesus,religieux).
prop(jesus,masculin).
prop(jesus,separer).
prop(jesus,reel).
prop(jesus,mort).

%-------------------------------------------
%
%   Attributs
%
%-------------------------------------------

livre(harry_Potter).
livre(les_Miserables).

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

metier(chat).

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

eau(separer).
eau(marcher).

domaine(ia).
domaine(logiciel_Libre).

gouverne(canada).
gouverne(egypte_ancienne).


verifieAttributs(_,[]).
verifieAttributs(Nom,[Attribut|Q]):-
  personne(Nom),
  prop(Nom,Attribut),
  verifieAttributs(Nom,Q).