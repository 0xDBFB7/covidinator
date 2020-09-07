
from numpy.random import choice




probabilities = [0.7, 0.2, 0.1]

draw = choice(list_of_candidates, 8,
              p=probabilities)
