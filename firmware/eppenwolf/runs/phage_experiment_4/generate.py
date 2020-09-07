import pickle
from numpy.random import choice

candidate_names = ["Phage           ", "Autoclaved Phage", "Broth           "]
candidates = [0,1,2]

probabilities = [0.7, 0.2, 0.1]

choices = []

for i in range(0, 100):
    draw = choice(candidates, 8,
                  p=probabilities)
    choices.append(draw)
    for i in draw:
        print(candidate_names[i], end = "\t")
    print("")

pickle.dump(choices,open("choices.pkl", "wb" ))
