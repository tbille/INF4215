
%-------------------------------------------
%
%   Recherche Objets
%
%-------------------------------------------

ask(materiel,Materiel):-
  format("Votre objet est-il compose principalement de ~w ? ",[Materiel]),
  read(Reponse),
  Reponse = oui.

ask(localisation,Localisation):-
  format("Votre objet se trouve-il le plus souvent dans le(la) ~w ? ",[Localisation]),
  read(Reponse),
  Reponse = oui.

ask(fonction,Fonction):-
  format("Votre objet sert-il de(d') ~w ? ",[Fonction]),
  read(Reponse),
  Reponse = oui.


objet(X):-
  matiere(Y),
  ask(materiel,Y),!,
  localisationObjet(X),
  prop(X,Y).

localisationObjet(X):-
  localisation(Y),
  ask(localisation,Y),!,
  particularite(X,Y),
  prop(X,Y).


%divertissement
particularite(X,salon):-
  divertissement(Y),
  ask(fonction,Y),!,
  prop(X,Y).
particularite(X,chambre):-
  divertissement(Y),
  ask(fonction,Y),!,
  prop(X,Y).


%fonction
particularite(X,garage):-
  fonction(Y),
  ask(fonction,Y),!,
  prop(X,Y).
particularite(X,cuisine):-
  fonction(Y),
  ask(fonction,Y),!,
  prop(X,Y).
particularite(X,salle_de_bain):-
  fonction(Y),
  ask(fonction,Y),!,
  prop(X,Y).

%reste
particularite(_,corps).
particularite(_,poche).

particularite(X,bureau):-
  fourniture(Y),
  ask(fonction,Y),!,
  prop(X,Y).

%-------------------------------------------
%
%   Objets
%
%-------------------------------------------

objets(aspirateur).
objets(assiette).
objets(balai).
objets(cactus).
objets(cafetiere).
objets(casserole).
objets(cle).
objets(cuisiniere).
objets(detergent_a_vaisselle).
objets(four_micro_onde).
objets(fourchette).
objets(grille_pain).
objets(lampe).
objets(lit).
objets(ordinateur).
objets(papier).
objets(piano).
objets(porte_feuille).
objets(sac_a_dos).
objets(shampoing).
objets(table).
objets(telephone).
objets(chaussure).
objets(jeu_de_carte).
objets(bicyclette).
objets(table_de_billard).
objets(album_photos).
objets(horloge).
objets(sac_de_chips).
objets(cube_rubik).
objets(television).
objets(parfum).
objets(dvd).
objets(lego).
objets(tylenol).
objets(systeme_de_son).
objets(marteau).
objets(lunettes).
objets(enveloppe).


%-------------------------------------------
%
%   Props
%
%-------------------------------------------


prop(aspirateur,entretien).
prop(aspirateur,plastique).
prop(aspirateur,garage).

prop(assiette,porcelaine).
prop(assiette,cuisine).
prop(assiette,vaisselle).

prop(balai,cuisine).
prop(balai,bois).
prop(balai,entretien).

prop(cactus,decoration).
prop(cactus,plante).
prop(cactus,salon).

prop(cafetiere,cafe).
prop(cafetiere,cuisine).
prop(cafetiere,plastique).

prop(casserole,cuisine).
prop(casserole,vaisselle).
prop(casserole,teffal).

prop(cle,poche).
prop(cle,metal).

prop(cuisiniere,cuire).
prop(cuisiniere,cuisine).
prop(cuisiniere,metal).

prop(detergent_a_vaisselle,cuisine).
prop(detergent_a_vaisselle,liquide).
prop(detergent_a_vaisselle,laver).

prop(four_micro_onde,griller).
prop(four_micro_onde,cuisine).
prop(four_micro_onde,metal).

prop(fourchette,cuisine).
prop(fourchette,vaisselle).
prop(fourchette,metal).

prop(grille_pain,griller).
prop(grille_pain,cuisine).
prop(grille_pain,metal).

prop(lampe,chambre).
prop(lampe,decoration).
prop(lampe,metal).

prop(lit,bois).
prop(lit,chambre).
prop(lit,meuble).

prop(ordinateur,electronique).
prop(ordinateur,metal).
prop(ordinateur,bureau).

prop(papier,bureau).
prop(papier,papier).
prop(papier,contenant).

prop(piano,salon).
prop(piano,musique).
prop(piano,bois).

prop(porte_feuille,poche).
prop(porte_feuille,cuir).

prop(enveloppe,papier).
prop(enveloppe,bureau).
prop(enveloppe,conteneur).

prop(sac_a_dos,corps).
prop(sac_a_dos,tissu).

prop(shampoing,liquide).
prop(shampoing,salle_de_bain).
prop(shampoing,laver).

prop(table,salon).
prop(table,bois).
prop(table,meuble).

prop(telephone,communiquer).
prop(telephone,salon).
prop(telephone,plastique).

prop(chaussure,corps).
prop(chaussure,cuir).

prop(jeu_de_carte,papier).
prop(jeu_de_carte,salon).
prop(jeu_de_carte,jeu_reflexion).

prop(bicyclette,metal).
prop(bicyclette,garage).
prop(bicyclette,deplacer).

prop(table_de_billard,jeu_reflexion).
prop(table_de_billard,bois).
prop(table_de_billard,salon).

prop(album_photos,salon).
prop(album_photos,papier).
prop(album_photos,decoration).

prop(horloge,decoration).
prop(horloge,bois).
prop(horloge,bureau).

prop(sac_de_chips,cuisine).
prop(sac_de_chips,plastique).
prop(sac_de_chips,nourriture).

prop(cube_rubik,plastique).
prop(cube_rubik,jeu_reflexion).
prop(cube_rubik,chambre).

prop(television,salon).
prop(television,plastique).
prop(television,meuble).

prop(parfum,liquide).
prop(parfum,salle_de_bain).
prop(parfum,beaute).

prop(dvd,plastique).
prop(dvd,salon).
prop(dvd,film).

prop(lego,plastique).
prop(lego,chambre).
prop(lego,jeu_construction).

prop(tylenol,medicament).
prop(tylenol,salle_de_bain).
prop(tylenol,soigner).

prop(systeme_de_son,plastique).
prop(systeme_de_son,salon).
prop(systeme_de_son,musique).

prop(marteau,metal).
prop(marteau,garage).
prop(marteau,entretien).

prop(lunettes,plastique).
prop(lunettes,corps).


%-------------------------------------------
%
%   Attributs
%
%-------------------------------------------

localisation(cuisine).
localisation(bureau).
localisation(chambre).
localisation(salon).
localisation(salle_de_bain).
localisation(poche).
localisation(garage).
localisation(corps).

matiere(plastique).
matiere(metal).
matiere(papier).
matiere(bois).
matiere(medicament).
matiere(cuir).
matiere(tissu).
matiere(liquide).
matiere(plante).
matiere(porcelaine).
matiere(teffal).

fonction(entretien).
fonction(vaisselle).
fonction(laver).
fonction(cuire).
fonction(griller).
fonction(rechauffer).
fonction(cafe).
fonction(nourriture).
fonction(soigner).
fonction(deplacer).
fonction(beaute).
fonction(communiquer).

divertissement(jeu_reflexion).
divertissement(jeu_construction).
divertissement(musique).
divertissement(decoration).
divertissement(meuble).
divertissement(film).

fourniture(electronique).
fourniture(conteneur).
fourniture(contenant).
