import numpy as np
import matplotlib.pyplot as plt
from math import pi, sqrt, e, log, isclose, exp


background = np.genfromtxt(open('sic_background_9.csv', "r"), delimiter=",", dtype=np.float, encoding='ascii')

sic = np.genfromtxt(open('sic_9.csv', "r"), delimiter=",", dtype=np.float, encoding='ascii', skip_header=1, skip_footer=1)


#
# background = np.split(background, np.argwhere(background[:,0] == 11.95).flatten()[1:], axis=0)
# sic = np.split(background, np.argwhere(sic[:,0] == 11.95).flatten()[1:], axis=0)

# print(sic)
# averaged_background = np.mean(background, 0)
# averaged_sic = np.mean(sic, 0)

print(background)
print(sic)

plt.plot(averaged_sic[:,0], averaged_sic[:,1] - averaged_background[:,1])
plt.plot(averaged_sic[:,0], averaged_sic[:,2] - averaged_background[:,2])

plt.show()
