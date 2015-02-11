from node import *
from state import *
from astar_search import *
from piece import *

import sys
import math
import copy

class Tangram(State):
    def __init__(self,_pattern,_pieces):
        self.grid = _pattern
        #self.pieces = _pieces
        self.counter = 0
        self.pieces=map(lambda s: Piece(s), _pieces )
        
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
        for i in xrange(0,len(_piece[0])-1):
            if(_piece[0][i] != ' ') :
                self.pieces[int(_piece[0][i])].placed = True
            
        for i in xrange(0,len(_piece[0])-1):
            for j in xrange(0,len(_piece)-1) :
                self.grid[_x+i][_y+j] = _piece[i][j]
        
        print "yolo"

    # Returns a list of possible actions with the current state
    def possibleActions(self):
        actions = []
        #(dimX,dimY) = self.dimensions
        dimX = len(self.grid[0])
        dimY = len(self.grid)
        for i in xrange(0,dimX-1) :
            for j in xrange(0,dimY-1) :
                if self.grid[i][j] == '*':
                    for piece in self.pieces :
                        if(not(piece.placed)):
                            for position in piece.piece :
                                if(self._checkPlace(position,i,j)) :
                                    actions.append([position,i,j])
        return actions

    def _checkPlace(self, _piece, _x, _y) :
        for i in xrange(0,len(_piece[0])-1):
            for j in xrange(0,len(_piece)-1) :
                if((len(self.grid[0]) < _x+i) and (len(self.grid) < _y+j)) :
                    if ( self.grid[_x+i][_y+j] != '*') :
                        return False
                else :
                    return False

        return True


    # Returns the cost of executing some action
    # By default, we suppose that all actions have the same cost = 1
    def cost(self,action):
        return 1

    # Returns a heuristic value that provides an estimate of the remaining
    # cost to achieve the goal
    # By default, value is 0
    def heuristic(self):
        return 0