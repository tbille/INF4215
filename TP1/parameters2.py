# -*- coding: utf-8 -*-
#from piece import *
from tangram import *

pattern =	[	[' ','*',' '],
				['*','*',' '],
				['*','*','*']	]

pieces = [	[	['*',' '],
				['*','*']	],

			[	['*','*','*']	]  ]

#solution = Tangram(pattern,pieces)
solution = astar_search(Tangram(pattern,pieces))
