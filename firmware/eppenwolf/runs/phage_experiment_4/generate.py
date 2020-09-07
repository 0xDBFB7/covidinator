
from numpy.random import choice




probabilities = [0.6, 0.2, 0.2]

draw = choice(list_of_candidates, 8,
              p=probabilities)
