
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




localisation(cuisine).
localisation(chambre).
localisation(salle_de_bain).

matiere(plastique).
matiere(metal).
matiere(papier).
matiere(bois).

fonction(entretien).
fonction(vaisselle).
fonction(divertissement).