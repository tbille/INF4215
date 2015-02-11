

class Piece():
  counter=0
  def __init__(self, _piece):
    self.piece=[_piece]
    Piece.counter+=1
    self.id=Piece.counter
    self.genererListeRotation()

  def show(self):
    print self.id
    print self.piece
    
  #
  # isSymetrieHorizontale
  # Permet de verifier si la piece a une symetrie Horizontale
  #   return  True si symetrie
  #           False sinon
  #
  def isSymetrieHorizontale(self):
    hauteur = len(self.piece[0])-1
    i=0
    res=True

    while res and i<hauteur :
      j=0
      while res and j<len(self.piece[0][i]):
        if not(self.piece[0][i][j] == self.piece[0][hauteur][j]) :
          res=False
        j+=1
      i+=1
      hauteur=hauteur-1

    return res

  #
  # isSymetrieVerticale
  # Permet de verifier si la piece a une symetrie Verticale
  #   return  True si symetrie
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
      while (bRes and (iLeft < iRight)) :
        if self.piece[iTop][iLeft]==self.piece[iTop][iRight] :
          iLeft += 1
          iRight -= 1
        else:
          bRes = False
      iTop += 1
      iLeft = 0
      iRight= iLongueur-1
    return bRes

  def genererListeRotation(self):

    b=False
    
    self.piece.append(self.tournerPiece(self.piece[0]))
    self.piece.append(self.tournerPiece(self.piece[1]))
    self.piece.append(self.tournerPiece(self.piece[2]))

    if self.isSymetrieVerticale() :
      del self.piece[3]
      b=True

    if self.isSymetrieHorizontale() :
      del self.piece[2]
      if b :
        del self.piece[1]


    


  def tournerPiece(self, maPiece) :
    return zip(*maPiece[::-1])
