
class Piece():
  def __init__(self, _piece, _id):
    self.piece=[_piece]
    self.id=_id

  #
  # isSymetrieHorizontale
  # Permet de vérifier si la pièce a une symétrie Horizontale
  #   return  True si symétrie
  #           False sinon
  #
  def isSymetrieHorizontale(self):
    hauteur = len(self.piece)-1
    i=0
    res=True

    while res and i<hauteur :
      j=0
      while res and j<len(self.piece[i]):
        if not(self.piece[i][j] == self.piece[hauteur][j]) :
          res=False
        j+=1
      i+=1
      hauteur=hauteur-1

    print res
    return res

  #
  # isSymetrieVerticale
  # Permet de vérifier si la pièce a une symétrie Verticale
  #   return  True si symétrie
  #           False sinon
  #
  def isSymetrieVerticale(self):

    iLongueur = len(self.piece[0])
    iHauteur  = len(self.piece)
    iLeft     = 0
    iRight    = iLongueur-1
    iTop      = 0
    
    bRes      = True

    while (bRes and (iTop < iHauteur)) :
      while (bRes and (iLeft < iLongueur)) :
        if self.piece[iTop][iLeft]==self.piece[iTop][iRight] :
          iLeft += 1
          iRight -= -1
        else:
          bRes = False
      iTop -= 1
      iLeft = 0
      iRight= iLongueur-1

    print bRes
    return bRes

  def genererListeRotation(self):

    if not(self.isSymetrieVerticale()) :
      self.piece.
      
    if not(self.isSymetrieHorizontale) :
      self.piece.append(self.tournerPiece(self.piece[0]))


    

  def tournerPiece(self, maPiece) :
    return zip(*maPiece[::-1])