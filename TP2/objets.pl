
%___________________________________________
%
%   Recherche Objets
%
%___________________________________________

ask(materiel,Materiel):_
  format("Votre objet est_il compose principalement de ~w ? ",[Materiel]),
  read(Reponse),
  Reponse = oui.

ask(localisation,Localisation):_
  format("Votre objet se trouve_il le plus souvent dans le(la) ~w ? ",[Localisation]),
  read(Reponse),
  Reponse = oui.

ask(fonction,Fonction):_
  format("Votre objet sert_il de(d') ~w ? ",[Fonction]),
  read(Reponse),
  Reponse = oui.


objets(X):_
  matiere(Y),
  ask(materiel,Y),!,
  localisationObjet(X),
  prop(X,Y).

localisationObjet(X):_
  localisation(Y),
  ask(localisation,Y),!,
  particularite(X,Y),
  prop(X,Y).


%divertissement
particularite(X,salon):-!.
particularite(X,chambre):-!.

%fonction
particularite(X,garage):-!.
particularite(X,cuisine):-!.
particularite(X,salle_de_bain):-!.

%
particularite(X,_):-!.



%___________________________________________
%
%   Objets
%
%___________________________________________

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


%___________________________________________
%
%   Props
%
%___________________________________________


prop(aspirateur,entretien).
prop(aspirateur,plastique).
prop(aspirateur,garage).

prop(assiette,plastique).
prop(assiette,cuisine).
prop(assiette,vaisselle).

prop(balai,cuisine).
prop(balai,bois).
prop(balai,entretien).

prop(cactus,decoration).
prop(cactus,plante).
prop(cactus,salon).

prop(cafetiere,electromenager).
prop(cafetiere,cuisine).
prop(cafetiere,plastique).

prop(casserole,cuisine).
prop(casserole,vaisselle).
prop(casserole,metal).

prop(cle,poche).
prop(cle,metal).

prop(cuisiniere,electromenager).
prop(cuisiniere,cuisine).
prop(cuisiniere,metal).

prop(detergent_a_vaisselle,cuisine).
prop(detergent_a_vaisselle,liquide).
prop(detergent_a_vaisselle,laver).

prop(four_micro_onde,electromenager).
prop(four_micro_onde,cuisine).
prop(four_micro_onde,metal).

prop(fourchette,cuisine).
prop(fourchette,vaisselle).
prop(fourchette,metal).

prop(grille_pain,electromenager).
prop(grille_pain,cuisine).
prop(grille_pain,metal).

prop(lampe,chambre).
prop(lampe,decoration).
prop(lampe,metal).

prop(lit,bois).
prop(lit,chambre).

prop(ordinateur,electronique).
prop(ordinateur,metal).
prop(ordinateur,bureau).

prop(papier,bureau).
prop(papier,papier).

prop(piano,salon).
prop(piano,musique).
prop(piano,bois).

prop(porte_feuille,poche).
prop(porte_feuille,cuir).

prop(enveloppe,papier).
prop(enveloppe,bureau).

prop(sac_a_dos,corps).
prop(sac_a_dos,tissu).

prop(shampoing,liquide).
prop(shampoing,salle_de_bain).
prop(shampoing,laver).

prop(table,cuisine).
prop(table,bois).

prop(telephone,electronique).
prop(telephone,salon).
prop(telephone,plastique).

prop(chaussure,corps).
prop(chaussure,cuir).

prop(jeu_de_carte,papier).
prop(jeu_de_carte,salon).
prop(jeu_de_carte,jeu).

prop(bicyclette,metal).
prop(bicyclette,garage).

prop(table_de_billard,jeu).
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

prop(cube_rubik,plastique).
prop(cube_rubik,jeu).
prop(cube_rubik,chambre).

prop(television,electronique).
prop(television,jeu).
prop(television,plastique).

prop(parfum,portable).
prop(parfum,salle_de_bain).

prop(dvd,electronique).
prop(dvd,plastique).
prop(dvd,salon).

prop(lego,plastique).
prop(lego,chambre).
prop(lego,jeu).

prop(tylenol,medicament).
prop(tylenol,salle_de_bain).

prop(systeme_de_son,plastique).
prop(systeme_de_son,salon).
prop(systeme_de_son,musique).

prop(marteau,metal).
prop(marteau,garage).

prop(lunettes,plastique).
prop(lunettes,corps).

prop(enveloppe,bureau).
prop(enveloppe,papier).

%___________________________________________
%
%   Attributs
%
%___________________________________________

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

fonction(entretien).
fonction(vaisselle).
fonction(laver).

divertissement(jeu).
divertissement(musique).
divertissement(decoration).


portabilite(portable).
portabilite(fixe).

conteneur(contenant).
conteneur(contenu).

electricite(electromenager).
electricite(electronique).