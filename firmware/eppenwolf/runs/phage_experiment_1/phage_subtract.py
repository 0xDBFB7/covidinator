import numpy as np
import matplotlib.pyplot as plt
from math import pi, sqrt, e, log, isclose, exp

valid_lines = []
with open('phage_run_1.csv', "r") as f:
    for line in f:
        if(line.count(',') == 9):
            valid_lines.append(line)


data = np.genfromtxt(valid_lines, delimiter=",", dtype=np.float, encoding='ascii', skip_header=0)


data = np.array(np.vsplit(data, np.ndarray.flatten(np.argwhere(data[:,0] == 12.00)+1)))[0:-1]


# Phage | Autoclaved phage | Sterile nutrient broth | Sterile nutrient broth | Phage | Autoclaved phage

phage_0 = 0
phage_1 = 4

autoclaved_phage_0 = 1
autoclaved_phage_1 = 5

sterile_broth_0 = 2
sterile_broth_1 = 3

# 2 repeats of 3 power levels, 6 cuvettes, 10 cycles each of 61 frequencies (0.2v each) with 10 columns.

# data = np.vsplit(data, np.shape(data)[0]/2)

data = np.reshape(data, (2, 3, 6, 10))

# print(np.shape(data[0, 0, 0, 0]))
# reshaped_data = np.zeros((2, 3, 6, 10))

# reshaped_data[:,:,:,:]






data = np.mean(data, 3)
print(np.shape(data))





# print(averaged_background)
#
# print(background)
# print(sic)

def freq_eq(x):
    #HMC732 VCO approx equation
 return 0.4794e9*x + 5.874e9

freqs = freq_eq(data[0, 0, 0][:,0])

plt.plot(freqs, (data[0, 0, 0][:,1] - data[0, 0, 1][:,1]) / data[0, 0, 1][:,1])
plt.plot(freqs, (data[0, 0, 0][:,2] - data[0, 0, 1][:,2]) / data[0, 0, 1][:,2])

plt.plot(freqs, (data[1, 0, 0][:,1] - data[1, 0, 1][:,1]) / data[1, 0, 1][:,1])
plt.plot(freqs, (data[1, 0, 0][:,2] - data[1, 0, 1][:,2]) / data[1, 0, 1][:,2])


plt.plot(freqs, (data[0, 0, 0][:,1] - data[0, 0, 1][:,1]) / data[0, 0, 1][:,1])
plt.plot(freqs, (data[0, 0, 0][:,2] - data[0, 0, 1][:,2]) / data[0, 0, 1][:,2])

plt.plot(freqs, (data[1, 0, 0][:,1] - data[1, 0, 1][:,1]) / data[1, 0, 1][:,1])
plt.plot(freqs, (data[1, 0, 0][:,2] - data[1, 0, 1][:,2]) / data[1, 0, 1][:,2])

plt.figure()
plt.plot(data[0, 0, 0][:,])
# plt.plot(freqs, (data[0, 0, 0][:,1] - data[0, 0, 1][:,1]) / data[0, 0, 0][:,2])
#
# plt.plot(freqs, (data[0, 0, 4][:,1] - data[0, 0, 5][:,1]) / data[0, 0, 5][:,1])
# plt.plot(freqs, (data[0, 0, 4][:,2] - data[0, 0, 5][:,2]) / data[0, 0, 5][:,2])

# plt.plot(freqs, (data[0, 0, 0][:,1] - data[0, 0, 1][:,1]) / data[0, 0, 0][:,2])

plt.show()

# freqs = freq_eq(averaged_sic[:,0])

# plt.plot(freqs, (averaged_sic[:,1] - averaged_background[:,1]) / averaged_background[:,1],label="'Near' sensor,  $\propto$S$_{11}$")
# plt.plot(freqs, (averaged_sic[:,2] - averaged_background[:,2]) / averaged_background[:,2],label="'Far' sensor,  $\propto$S$_{21}$")
# plt.legend()
# plt.savefig("sic_9_1.svg")
# plt.title("Normalized silicon carbide susceptor spectrum")
# plt.ticklabel_format(style='sci', axis='x', scilimits=(9,9))
# plt.xlabel("Frequency (GHz)")
# plt.figure()
# plt.plot(freqs, averaged_sic[:,1],label="SiC susceptor, 'Near' sensor,  $\propto$S$_{11}$")
# plt.plot(freqs, averaged_sic[:,2],label="SiC susceptor, 'Far' sensor,  $\propto$S$_{21}$")
# plt.plot(freqs, averaged_background[:,1],label="Background, 'Near' sensor,  $\propto$S$_{11}$")
# plt.plot(freqs, averaged_background[:,2],label="Background, 'Far' sensor,  $\propto$S$_{21}$")
# plt.ticklabel_format(style='sci', axis='x', scilimits=(9,9))
# plt.legend()
# plt.xlabel("Frequency (GHz)")
# plt.ylabel("Voltage")
# plt.title("Raw detector voltage")
# plt.savefig("sic_9_2.svg")
# plt.show()
