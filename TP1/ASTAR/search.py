from astar_search import *
from tangram import *

def search(Pattern,Pieces) :
  return astar_search(Tangram(Pattern,Pieces))