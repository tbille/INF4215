from node import *
from state import *
from astar_search import *
from parameters import pattern
from parameters import pieces

class Tangram(State):
    def __init__(self,_pattern,_pieces):
        self.pattern = _pattern
        self.pieces = _pieces
        self.counter = 0

    # Checks whether current state and the one passed as parameter are exactly the same
    def equals(self,state):
        return False

    # Checks whether the state is a goal state
    def isGoal(self):
        return self.grid == state.grid

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
    def executeAction(self,action):
        pass

    # Returns a list of possible actions with the current state
    def possibleAction(self):
        return []

    # Returns the cost of executing some action
    # By default, we suppose that all actions have the same cost = 1
    def cost(self,action):
        return 1

    # Returns a heuristic value that provides an estimate of the remaining
    # cost to achieve the goal
    # By default, value is 0
    def heuristic(self):
        return 0