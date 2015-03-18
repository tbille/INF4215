personnes(Nom):-
  genre(Genre),
  style(Style),
  vie(Vie),
  findall(Noms,personne(Noms,musicien,ListeMusiciens),ListeMusiciens),
  chercher(Nom,ListeMusiciens,[Genre,Style,Vie]).

personnes(Nom):-
  genre(Genre),
  vie(Vie),
  gouverne(Pays)
  findall(Noms,personne(Noms,politicien,ListePoliticiens),ListePoliticiens),
  chercher(Nom,ListePoliticiens,[Genre,Vie]).

personnes(Nom):-
  genre(Genre),
  vie(Vie),
  findall(Noms,personne(Noms,acteur,ListeActeurs),ListeActeurs),
  chercher(Nom,ListeActeurs,[Genre,Vie]).

personnes(Nom):-
  genre(Genre),
  vie(Vie),
  domaine(Domaine)
  findall(Noms,personne(Noms,professeur,ListeProfesseurs),ListeProfesseurs),
  chercher(Nom,ListeProfesseurs,[Genre,Vie,Domaine]).

personnes(Nom):-
  genre(Genre),
  vie(Vie),
  source(Source)
  findall(Noms,personne(Noms,fictif,ListeFictifs),ListeFictifs),
  chercher(Nom,ListeFictifs,[Genre,Vie,Source]).

personnes(Nom):-
  genre(Genre),
  vie(Vie),
  sport(Sport)
  findall(Noms,personne(Noms,sportif,ListeSportifs),ListeSportifs),
  chercher(Nom,ListeSportifs,[Genre,Vie,Sport]).



chercher(_,[],_):-fail.
chercher(Nom,[Nom|_],LAttributs):-verifieAttributs(Nom,LAttributs),!.
chercher(Nom,[_|Q],LAttributs):-chercher(Nom,Q,LAttributs).


verifieAttributs(_,[]).
verifieAttributs(Nom,[Attribut|Q]):-
  personne(Nom,_,LAttributs),
  member(Attribut,LAttributs),
  verifieAttributs(Nom,Q).

%-------------------------------------------
%
%   Personnes
%
%-------------------------------------------

% musiciens
personne(michael_Jackson,musicien,[masculin,pop,mort]).
personne(wolfgang_Amadeus_Mozart,musicien,[masculin,classique,mort]).
personne(john_Lewis,musicien,[masculin,jazz,mort]).

% politiciens
personne(stephen_Harper,politicien,[masculin,vivant,canada]).
personne(cleopatre_VII,politicien,[feminin,mort,egypte]).

% acteurs
personne(brad_Pitt, acteur,[masculin,vivant]).
personne(julie_Snyder,acteur,[feminin,vivant]).

% professeur
personne(michel_Gagnon,professeur,[masculin,vivant,ia]).
personne(michel_Dagenais,professeur,[masculin,vivant,logiciel_Libre]).

% fictif
personne(lara_croft,fictif,[feminin,jeuVideo]).
personne(mario,fictif,[masculin,jeuVideo]).
personne(garfield,fictif,[masculin]).
personne(james_Bond,fictif,[masculin,film]).
personne(blanche_neige,fictif,[feminin,film]).

% sportif
personne(jacques_Villeneuve,sportif,[masculin,f1]).
personne(rafael_Nadal,sportif,[masculin,tennis]).
personne(eugenie_Bouchard,sportif,[feminin,tennis]).

% auteur
personne(victor_Hugo, auteur,[masculin,mort]).
personne(j_K_Rowling, auteur,[feminin,vivant]).

% religieux
personne(pape_Francois, religieux,[masculin,vivant]).
personne(moise, religieux,[masculin,marcher,mort]).
personne(jesus, religieux,[masculin,separer,mort]).


%-------------------------------------------
%
%   Attributs
%
%-------------------------------------------
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