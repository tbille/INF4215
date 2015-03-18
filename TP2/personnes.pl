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

personne(michael_Jackson,[musicien,masculin,pop,mort]).
personne(wolfgang_Amadeus_Mozart,[musicien,masculin,classique,mort]).
personne(john_Lewis,[musicien,masculin,jazz,mort]).
personne(stephen_Harper,[politicien,masculin,vivant,canada]).
personne(cleopatre_VII,[politicien,feminin,mort,egypte]).
personne(brad_Pitt,[acteur,masculin,vivant]).
personne(julie_Snyder,[acteur,feminin,vivant]).
personne(michel_Gagnon,[professeur,masculin,vivant,ia]).
personne(michel_Dagenais,[professeur,masculin,vivant,logiciel_Libre]).
personne(lara_croft,[fictif,feminin,jeuVideo]).
personne(mario,[fictif,masculin,jeuVideo]).
personne(garfield,[fictif,chat,masculin]).
personne(james_Bond,[fictif,masculin,film]).
personne(blanche_neige,[fictif,feminin,film]).
personne(jacques_Villeneuve,[sportif,masculin,f1]).
personne(rafael_Nadal,[sportif,masculin,tennis]).
personne(eugenie_Bouchard,[sportif,feminin,tennis]).
personne(victor_Hugo,[auteur,masculin,mort]).
personne(j_K_Rowling,[auteur,feminin,vivant]).
personne(pape_Francois,[religieux,masculin,vivant]).
personne(moise,[religieux,masculin,marcher,mort]).
personne(jesus,[religieux,masculin,separer,mort]).


prop(mario,fictif).
prop(mario,masculin).
prop(mario,jeuVideo).
prop(garfield,chat).
prop(garfield,fictif).
prop(garfield,masculin).
prop(james_Bond,film).
prop(james_Bond,fictif).
prop(james_Bond,masculin).
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