import numpy as np
import matplotlib.pyplot as plt
from math import pi, sqrt, e, log, isclose, exp


background = np.genfromtxt(open('sic_background_9.csv', "r"), delimiter=",", dtype=np.float, encoding='ascii', skip_header=0)

sic = np.genfromtxt(open('sic_9.csv', "r"), delimiter=",", dtype=np.float, encoding='ascii', skip_footer=1)

# print(np.argwhere(background[:,0] == 11.95))
background = np.array(np.vsplit(background, np.ndarray.flatten(np.argwhere(background[:,0] == 11.95)+1)))[0:-1]
sic = np.array(np.vsplit(sic, np.ndarray.flatten(np.argwhere(sic[:,0] == 11.95)+1)))[0:-1]

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

def freq_eq(x):
    #HMC732 VCO approx equation
 return 0.4794e9*x + 5.874e9

freqs = freq_eq(averaged_sic[:,0])

plt.plot(freqs, (averaged_sic[:,1] - averaged_background[:,1]) / averaged_background[:,1],label="'Near' sensor,  $\propto$S$_{11}$")
plt.plot(freqs, (averaged_sic[:,2] - averaged_background[:,2]) / averaged_background[:,2],label="'Far' sensor,  $\propto$S$_{21}$")
plt.legend()
plt.savefig("sic_9_1.svg")
plt.title("Normalized silicon carbide susceptor spectrum")
plt.ticklabel_format(style='sci', axis='x', scilimits=(9,9))
plt.xlabel("Frequency (GHz)")
plt.figure()
plt.plot(freqs, averaged_sic[:,1],label="SiC susceptor, 'Near' sensor,  $\propto$S$_{11}$")
plt.plot(freqs, averaged_sic[:,2],label="SiC susceptor, 'Far' sensor,  $\propto$S$_{21}$")
plt.plot(freqs, averaged_background[:,1],label="Background, 'Near' sensor,  $\propto$S$_{11}$")
plt.plot(freqs, averaged_background[:,2],label="Background, 'Far' sensor,  $\propto$S$_{21}$")
plt.ticklabel_format(style='sci', axis='x', scilimits=(9,9))
plt.legend()
plt.xlabel("Frequency (GHz)")
plt.ylabel("Voltage")
plt.title("Raw detector voltage")
plt.savefig("sic_9_2.svg")
# plt.show()

plt.figure()
plt.plot(freqs, (averaged_sic[:,2]/averaged_sic[:,1]) / (averaged_background[:,2]/averaged_background[:,1]),label="'Far' sensor,  $\propto$S$_{21}$")
plt.show()
