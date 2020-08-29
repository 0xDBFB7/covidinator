import numpy as np
import matplotlib.pyplot as plt
from math import pi, sqrt, e, log, isclose, exp


background = np.genfromtxt(open('sic_background_9.csv', "r"), delimiter=",", dtype=np.float, encoding='ascii', skip_header=0)

sic = np.genfromtxt(open('sic_9.csv', "r"), delimiter=",", dtype=np.float, encoding='ascii', skip_footer=1)

print(np.argwhere(background[:,0] == 11.95))
background = np.array(np.vsplit(background, np.ndarray.flatten(np.argwhere(background[:,0] == 0.0))))
sic = np.array(np.vsplit(sic, np.ndarray.flatten(np.argwhere(sic[:,0] == 0.0))))

# print(background)
#
# background = background[np.size(background) > 0]
# sic = sic[np.size(sic) > 0]
#


# print(sic)
averaged_background = np.mean(background)
averaged_sic = np.mean(sic)

print(averaged_background)
#
# print(background)
# print(sic)

plt.plot(averaged_sic[:,0], averaged_sic[:,1] - averaged_background[:,1])
plt.plot(averaged_sic[:,0], averaged_sic[:,2] - averaged_background[:,2])

plt.show()
