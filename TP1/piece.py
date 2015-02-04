
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
    iRight    = iLongueur
    iTop      = 0
    iBottom   = iHauteur
    
    bRes      = true

    while (bRes and (iTop not iHauteur)) :
      while (bRes and (iLeft not iLongueur)) :
        if piece[iTop][iRight]==piece[iHauteur]
        i += 1
        iHauteur -= -1
      else
        res=false

        
      if piece[i]==piece[iHauteur]
        i += 1
        iHauteur-1
      else
        res=false
    }

    return r
    pass

  def tournerPiece():
    pass
