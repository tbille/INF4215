from hillclimbing import *
from tangram import *

def search(Pattern,Pieces) :
  return hillclimbing_search(Tangram(Pattern,Pieces))