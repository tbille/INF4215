
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


%-------------------------------------------
%
%   Props
%
%-------------------------------------------


prop(aspirateur,electromenager).
prop(aspirateur,entretien).
prop(aspirateur,plastique).
prop(aspirateur,fixe).
prop(aspirateur,).   %----------------------

prop(assiette,portable).
prop(assiette,cuisine).
prop(assiette,vaisselle).

prop(balai,cuisine).
prop(balai,entretien).

prop(cactus,decoration).

prop(cafetiere,electromenager).
prop(cafetiere,cuisine).
prop(cafetiere,plastique).

prop(casserole,cuisine).
prop(casserole,vaisselle).
prop(casserole,contenur).
prop(casserole,metal).

prop(cle,portable).
prop(cle,poche).
prop(cle,metal).

prop(cuisiniere,electromenager).
prop(cuisiniere,cuisine).
prop(cuisiniere,metal).

prop(detergent_a_vaisselle,cuisine).
prop(detergent_a_vaisselle,entretien).
prop(detergent_a_vaisselle,laver).

prop(four_micro-onde,electromenager).
prop(four_micro-onde,cuisine).
prop(four_micro-onde,contenant).
prop(four_micro-onde,metal).

prop(fourchette,cuisine).
prop(fourchette,vaisselle).
prop(fourchette,metal).

prop(grille-pain,electromenager).
prop(grille-pain,cuisine).
prop(grille-pain,contenant).
prop(grille-pain,metal).

prop(lampe,chambre).
prop(lampe,decoration).
prop(lampe,metal).

prop(lit,bois).
prop(lit,chambre).

prop(ordinateur,electronique).
prop(ordinateur,metal).
prop(ordinateur,bureau).

prop(papier,chambre).
prop(papier,papier).

prop(piano,decoration).
prop(piano,musique).
prop(piano,bois).

prop(porte-feuille,portable).
prop(porte-feuille,poche).
prop(porte-feuille,cuir).


prop(enveloppe,).
prop(enveloppe,).
prop(enveloppe,).
prop(enveloppe,).

%-------------------------------------------
%
%   Attributs
%
%-------------------------------------------

localisation(cuisine).
localisation(chambre).
localisation(salle_de_bain).
localisation(poche).

matiere(plastique).
matiere(metal).
matiere(papier).
matiere(bois).

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