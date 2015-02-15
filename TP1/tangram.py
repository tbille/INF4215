from node import *
from state import *
from astar_search import *
from piece import *

class Tangram(State):
    def __init__(self,_pattern,_pieces):

        self.grid = _pattern
        self.counter = 0
        self.pieces=map(lambda s: Piece(s), _pieces)

        self.maxCost = self.getMaxCost(self.pieces)
        
        map(lambda s: s.show(), self.pieces )


    # Checks whether current state and the one passed as parameter are exactly the same
    def equals(self,state):
        return False

    # Checks whether the state is a goal state
    def isGoal(self):
        for row in self.grid:
            for cell in row:
                if cell == '*':
                    return False
        return True

    # Prints to the console a description of the state
    def show(self):
        for row in self.grid:
            for cell in row:
                if cell == -1:
                    print '**',
                else:
                    print '{:2}'.format(cell),
            print

    # State is updated according to action
    def executeAction(self,(_piece,x,y)):
        PdimX = len(_piece[0])
        PdimY = len(_piece)
        for i in range(PdimX):
            if(_piece[0][i] != ' ') :
                self.pieces[int(_piece[0][i])-1].placed = True
        
        for i in range(PdimY):
            for j in range(PdimX):
                if (_piece[i][j] != ' '):
                    self.grid[y+i][x+j] = _piece[i][j]
        

    # Returns a list of possible actions with the current state
    def possibleActions(self):
        actions = []
        dimX = len(self.grid[0])
        dimY = len(self.grid)
        for i in range(dimY) :
            for j in range(dimX) :
            #if self.grid[i][j] == '*':
                for piece in self.pieces :
                    if(not(piece.placed)):
                        for position in piece.piece :
                            if(self._checkPlace(position,i,j)) :
                                actions.append([position,i,j])
        return actions

    def _checkPlace(self, _piece, _x, _y) :
        PdimX = len(_piece[0])
        PdimY = len(_piece)

        if( (len(self.grid[0]) >= _x+PdimX) and (len(self.grid) >= _y+PdimY) ) :
            for i in range(PdimY):
                for j in range(PdimX):
                    if ( (self.grid[_y+i][_x+j] != '*') and (_piece[i][j] != ' ') ) :
                        return False
            return True         
        else :
            return False


    # Returns the cost of executing some action
    # By default, we suppose that all actions have the same cost = 1
    def cost(self,action):
        cost = self.maxCost
        PdimX = len(action[0][0])
        PdimY = len(action[0])
        for i in range(PdimY):
                for j in range(PdimX):
                    if (action[0][i][j] != ' '):
                        cost -= 1
        return cost+1

    # Returns a heuristic value that provides an estimate of the remaining
    # cost to achieve the goal
    # By default, value is 0
    def heuristic(self):
        est = 0
        piecesRestantes = 0
        for row in self.grid:
            for cell in row:
                if cell == '*':
                    est += 1
        for piece in self.pieces :
            if (piece.placed == False):
                piecesRestantes += 1
        if (piecesRestantes == 0):
            return 0
        else :
            return est*(piecesRestantes)



    def getMaxCost(self,_pieces):
        max = 0
        for piece in _pieces :
            if piece.cost >= max:
                max = piece.cost
        return max