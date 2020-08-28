import numpy as np
import matplotlib.pyplot as plt
from math import pi, sqrt, e, log, isclose, exp


background = np.genfromtxt(open('sic_background_9.csv', "r"), delimiter=",", dtype=np.float, encoding='ascii')

sic = np.genfromtxt(open('sic_9.csv', "r"), delimiter=",", dtype=np.float, encoding='ascii', skip_header=1)

print(background)
print(sic)

background = np.split(background, background[:,0] == 0)
sic = np.split(sic, sic[:,0] == 0)

plt.plot(sic[:,0], sic[:,1] - background[:,1])
plt.plot(sic[:,0], sic[:,2] - background[:,2])

plt.show()
