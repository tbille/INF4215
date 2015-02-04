
class Piece():
  def __init__(self, _piece):
    self.piece = _piece



  def isSymetrieHorizontale():
    hauteur = len(self.piece)-1
    i=0
    res=true

    while res and i<hauteur :
      j=0
      while res and j<len(piece[i]):
        if not(piece[i][j] == piece[i][j]) :
          res=false
        j+=1
      i+=1
      hauteur=hauteur-1

    print res
    return res


  def isSymetrieVerticale():

    iLongueur = len(self.piece[0])
    iHauteur  = len(self.piece)
    iLeft     = 0
    iRight    = iLongueur-1
    iTop      = 0
    
    bRes      = true

    while (bRes and (iTop < iHauteur)) :
      while (bRes and (iLeft < iLongueur)) :
        if piece[iTop][iLeft]==piece[iTop][iRight] :
          iLeft += 1
          iRight -= -1
        else:
          bRes = false
      iTop -= 1
      iLeft = 0
      iRight= iLongueur-1

    return bRes

  def tournerPiece():
    pass
