import pickle
from numpy.random import choice, shuffle

candidate_names = ["P + G", "PA + G", "PA + W"]
candidates = [0,1,2]

# probabilities = [0.7, 0.2, 0.1]

slide = [0,0,0,0,1,1,2,2]

choices = []

for i in range(0, 10):
    shuffle(slide)
    draw = slide
    # draw = choice(candidates, 8,
    #               p=probabilities)
    choices.append(draw)
    print(i, end = "\t")
    for j in draw:
        print(candidate_names[j].ljust(10) + ' | ', end = "\t")
    print("")
    print("-"*10*13)

pickle.dump(choices,open("choices.pkl", "wb" ))
