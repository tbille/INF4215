personnes(Nom):-
  metier(musicien),
  genre(Genre),
  style(Style),
  vie(Vie),
  findall(Noms,personne(Noms,musicien,ListeMusiciens),ListeMusiciens),
  chercher(Nom,ListeMusiciens,[Genre,Style,Vie]).


vie(mort).
vie(vivant).

genre(masculin).
genre(feminin).

style(classique).
style(jazz).
style(pop).

jeuxVideo(lara_croft).
jeuxVideo(mario).

personnageFilms(blanche_neige).
personnageFilms(james_Bond).

tennis(rafal_Nadal).
tennis(eugenie_Bouchard).

eau(separer).
eau(marcher).

domaine(ia).
domaine(logiciel_Libre).

chercher(_,[],_):-fail.
chercher(Nom,[Nom|_],LAttributs):-verifieAttributs(Nom,LAttributs),!.
chercher(Nom,[_|Q],LAttributs):-chercher(Nom,Q,LAttributs).


verifieAttributs(_,[]).
verifieAttributs(Nom,[Attribut|Q]):-
  personne(Nom,_,LAttributs),
  member(Attribut,LAttributs),
  verifieAttributs(Nom,Q).

% musiciens
personne(michael_Jackson,musicien,[masculin,pop,mort]).
personne(wolfgang_Amadeus_Mozart,musicien,[masculin,classique,mort]).
personne(john_Lewis,musicien,[masculin,jazz,mort]).

% politiciens

% acteurs
personne(brad_Pitt, acteur,[masculin,vivant]).
personne(julie_Snyder,acteur,[feminin,vivant]).

% professeur
personne(michel_Gagnon,professeur,[masculin,vivant,ia]).
personne(michel_Dagenais,professeur,[masculin,vivant,logiciel_Libre]).

% fictif

% sportif

% auteur
personne(victor_Hugo, auteur,[masculin,mort]).
personne(j_K_Rowling, auteur,[feminin,vivant]).

% religieu
personne(pape_Francois, religieu,[masculin,vivant]).
personne(moise, religieu,[masculin,marcher,mort]).
personne(jesus, religieu,[masculin,separer,mort]).


