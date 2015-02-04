
class Piece():
  def __init__(self, _piece):
    self.piece = _piece



  def isSymetrieHorizontale(self):
    hauteur = len(self.piece)-1
    i=0
    res=True

    while res and i<hauteur :
      j=0
      while res and j<len(self.piece[i]):
        if not(self.piece[i][j] == self.piece[i][j]) :
          res=False
        j+=1
      i+=1
      hauteur=hauteur-1

    print res
    return res


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

  def tournerPiece():
    pass
