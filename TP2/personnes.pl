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
	[musicien,masculin,pop,mort]).
personne(wolfgang_Amadeus_Mozart).
	[musicien,masculin,classique,mort]).
personne(john_Lewis).
	[musicien,masculin,jazz,mort]).
personne(stephen_Harper).
	[politicien,masculin,vivant,canada]).
personne(cleopatre_VII).
	[politicien,feminin,mort,egypte]).
personne(brad_Pitt).
	[acteur,masculin,vivant]).
personne(julie_Snyder).
	[acteur,feminin,vivant]).
personne(michel_Gagnon).
	[professeur,masculin,vivant,ia]).
personne(michel_Dagenais).
	[professeur,masculin,vivant,logiciel_Libre]).
personne(lara_croft).
	[fictif,feminin,jeuVideo]).
personne(mario).
	[fictif,masculin,jeuVideo]).
personne(garfield).
	[fictif,chat,masculin]).
personne(james_Bond).
	[fictif,masculin,film]).
personne(blanche_neige).
	[fictif,feminin,film]).
personne(jacques_Villeneuve).
	[sportif,masculin,f1]).
personne(rafael_Nadal).
	[sportif,masculin,tennis]).
personne(eugenie_Bouchard).
	[sportif,feminin,tennis]).
personne(victor_Hugo).
	[auteur,masculin,mort]).
personne(j_K_Rowling).
	[auteur,feminin,vivant]).
personne(pape_Francois).
	[religieux,masculin,vivant]).
personne(moise).
	[religieux,masculin,marcher,mort]).
personne(jesus).
	[religieux,masculin,separer,mort]).

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