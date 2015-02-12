from node import *
from state import *
from astar_search import *
from piece import *

class Tangram(State):
    def __init__(self,_pattern,_pieces):

        print "-------------------- INITIAL STATE --------------------"

        print "grid"
        self.grid = _pattern
        print self.grid
        #self.pieces = _pieces
        self.counter = 0
        self.pieces=map(lambda s: Piece(s), _pieces )
        
        map(lambda s: s.show(), self.pieces )

        print "-------------------- INITIAL STATE --------------------"


    # Checks whether current state and the one passed as parameter are exactly the same
    def equals(self,state):
        return False

    # Checks whether the state is a goal state
    def isGoal(self):
        print "check"
        self.show()
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
        
        print "executing with :"
        print _piece
        for i in range(PdimY):
            for j in range(PdimX):
                print "replacing"
                self.show()
                self.grid[y+i][x+j] = _piece[i][j]
                print "replaced"
                self.show()
        print "done"
        
        

    # Returns a list of possible actions with the current state
    def possibleActions(self):
        actions = []
        #(dimX,dimY) = self.dimensions
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
        print "possible action ="
        print actions
        return actions

    def _checkPlace(self, _piece, _x, _y) :
        PdimX = len(_piece[0])
        PdimY = len(_piece)

        if( (len(self.grid[0]) >= _x+PdimX) and (len(self.grid) >= _y+PdimY) ) :
            for i in range(PdimY):
                for j in range(PdimX):
                    if ( (self.grid[_y+i][_x+j] == ' ') and (_piece[i][j] != ' ')) :
                        return False
            return True         
        else :
            return False


    # Returns the cost of executing some action
    # By default, we suppose that all actions have the same cost = 1
    def cost(self,action):
        return 1

    # Returns a heuristic value that provides an estimate of the remaining
    # cost to achieve the goal
    # By default, value is 0
    def heuristic(self):
        return 0