from node import *
from state import *

def astar_search(initialState):
    step = 0
    frontier = [Node(initialState)]
    while frontier:
        node = frontier.pop()
        step += 1
        # node.state.show()
        # print '----------------'
        if node.state.isGoal():
            node.state.show()
            print 'Cost:', node.g
            print 'Steps:', step
            return node
        elif node.isRepeated():
            continue
        else:
            frontier = node.expand() + frontier
            frontier.sort(cmp = lambda n1,n2: -1 if n1.f < n2.f else (1 if n1.f > n2.f else 0), 
                          reverse = True)
    return None
