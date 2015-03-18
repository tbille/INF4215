chercher([],_,[]).
chercher( [Nom|Q],LAttributs,[Nom|Res] ):-
  verifieAttributs(Nom,LAttributs),!,
  chercher(Q,LAttributs,Res).

chercher([_|Q],LAttributs,LNoms):-chercher(Q,LAttributs,LNoms).


verifieAttributs(_,[]).
verifieAttributs(Nom,[Attribut|Q]):-
  personne(Nom,LAttributs),
  member(Attribut,LAttributs),
  verifieAttributs(Nom,Q).

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
prop(michael_Jackson,mort).
prop(wolfgang_Amadeus_Mozart,musicien).
prop(wolfgang_Amadeus_Mozart,masculin).
prop(wolfgang_Amadeus_Mozart,classique).
prop(wolfgang_Amadeus_Mozart,mort).
prop(john_Lewis,musicien).
prop(john_Lewis,masculin).
prop(john_Lewis,jazz).
prop(john_Lewis,mort).
prop(stephen_Harper,politicien).
prop(stephen_Harper,masculin).
prop(stephen_Harper,vivant).
prop(stephen_Harper,canada).
prop(cleopatre_VII,politicien).
prop(cleopatre_VII,feminin).
prop(cleopatre_VII,mort).
prop(cleopatre_VII,egypte).
prop(brad_Pitt,acteur).
prop(brad_Pitt,masculin).
prop(brad_Pitt,vivant]).
prop(julie_Snyder,acteur).
prop(julie_Snyder,feminin).
prop(julie_Snyder,vivant).
prop(michel_Gagnon,professeur).
prop(michel_Gagnon,masculin).
prop(michel_Gagnon,vivant).
prop(michel_Gagnon,ia).
prop(michel_Dagenais,professeur).
prop(michel_Dagenais,masculin).
prop(michel_Dagenais,vivant).
prop(michel_Dagenais,logiciel_Libre).
prop(lara_croft,fictif).
prop(lara_croft,feminin).
prop(lara_croft,jeuVideo).
prop(lara_croft,aventurier).
prop(mario,fictif).
prop(mario,masculin).
prop(mario,jeuVideo).
prop(mario,plombier).
prop(garfield,chat).
prop(garfield,fictif).
prop(garfield,masculin).
prop(james_Bond,film).
prop(james_Bond,fictif).
prop(james_Bond,masculin).
prop(james_Bond,espion).
prop(blanche_neige,feminin).
prop(blanche_neige,fictif).
prop(blanche_neige,film).
prop(jacques_Villeneuve,f1).
prop(jacques_Villeneuve,masculin).
prop(jacques_Villeneuve,sportif).
prop(rafael_Nadal,tennis).
prop(rafael_Nadal,masculin).
prop(rafael_Nadal,sportif).
prop(eugenie_Bouchard,sportif).
prop(eugenie_Bouchard,feminin).
prop(eugenie_Bouchard,tennis).
prop(victor_Hugo,auteur).
prop(victor_Hugo,mort).
prop(victor_Hugo,masculin).
prop(victor_Hugo,les_Miserables).
prop(j_K_Rowling, auteur).
prop(j_K_Rowling,vivant).
prop(j_K_Rowling,feminin).
prop(pape_Francois, religieux).
prop(pape_Francois,masculin).
prop(pape_Francois,vivant).
prop(moise,religieux).
prop(moise,masculin).
prop(moise,marcher).
prop(moise,mort).
prop(jesus,religieux).
prop(jesus,masculin).
prop(jesus,separer).
prop(jesus,mort).

%-------------------------------------------
%
%   Attributs
%
%-------------------------------------------


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

animal(chat).

vie(mort).
vie(vivant).

genre(masculin).
genre(feminin).

style(classique).
style(jazz).
style(pop).

source(jeuVideo).
source(film).

sport(tennis).
sport(f1).

eau(separer).
eau(marcher).

domaine(ia).
domaine(logiciel_Libre).

gouverne(canada).
gouverne(egypte_ancienne).