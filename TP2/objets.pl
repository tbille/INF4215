
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


objets(aspirateur).
objets(assiette).
objets(balai).
objets(cactus).
objets(cafetiere).
objets(casserole).
objets(cle).
objets(cuisiniere).
objets(detergent_a_vaisselle).
objets(four_micro-onde).
objets(fourchette).
objets(grille-pain).
objets(lampe).
objets(lit).
objets(ordinateur).
objets(papier).
objets(piano).
objets(porte-feuille).
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







prop(sac_a_dos,portable).
prop(sac_a_dos,conteneur).
prop(sac_a_dos,tissu).
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
prop(sac_de_chips,conteneur).
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
prop(lego,plastique).
prop(lego,chambre).
prop(lego,jeu).
prop(lego,portable).
prop(tylenol,portable).
prop(tylenol,medicament).
prop(tylenol,salle_de_bain).
prop(tylenol,).
prop(systeme_de_son,fixe).
prop(systeme_de_son,plastique).
prop(systeme_de_son,salon).
prop(systeme_de_son,musique).
prop(marteau,metal).
prop(marteau,garage).
prop(marteau,entretien).
prop(marteau,portable).
prop(lunettes,plastique).
prop(lunettes,portable).
prop(lunettes,contenu).
prop(lunettes,poche).
prop(enveloppe,bureau).
prop(enveloppe,papier).
prop(enveloppe,portable).
prop(enveloppe,contenant).



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