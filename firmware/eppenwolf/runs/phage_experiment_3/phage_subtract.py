import numpy as np
import matplotlib.pyplot as plt
from math import pi, sqrt, e, log, isclose, exp

import scipy.integrate as integrate

valid_lines = []
with open('phage_run_3.csv', "r") as f:
    for line in f:
        if(line.count(',') == 14):
            valid_lines.append(line)


data = np.genfromtxt(valid_lines, delimiter=",", dtype=np.float, encoding='ascii', skip_header=0)


data = np.array(np.vsplit(data, np.ndarray.flatten(np.argwhere(data[:,0] == 11.95)+1)))[0:-1]


# ID 0                                                                                    ID 5
# Phage | Autoclaved phage | Sterile nutrient broth | Sterile nutrient broth | Phage | Autoclaved phage | Phage | Phage
#  A             A                     A                        B                B           B              A       B


phage_0 = 0
phage_1 = 4
phage_2 = 6
phage_3 = 7

autoclaved_phage_0 = 1
autoclaved_phage_1 = 5

sterile_broth_0 = 2
sterile_broth_1 = 3

near_sensor = 1
far_sensor = 2

slide_0 = 0
slide_1 = 1


#in this run, (looking after the fact, was blind before), on slide 0,  group B was not exposed, group A was.
#same for slide 1

# 2, pulse, 1, 1, iterations of
# 2 slides, 8 cuvettes, 5 sweeps

# data = np.vsplit(data, np.shape(data)[0]/2)

data = np.reshape(data, (4, 2, 8, 5))

data = np.mean(data, 3) # average along the column axis

print(np.shape(data))

group_A = [0, 1, 2, 6]
group_B = [3, 4, 5, 7]

group_A_phages = [0, 6]

# print(averaged_background)
#
# print(background)
# print(sic)

def get_data(test, slide, cuvette, parameter):
    data_ = data[test, slide, cuvette][:,parameter]
    data_ /= np.linalg.norm(data_)
    return data_

def normalized_diff(test, slide, cuvette_one, cuvette_two, parameter):
    return (get_data(test, slide, cuvette_one, parameter) - get_data(test, slide, cuvette_two, parameter)) / get_data(test, slide, cuvette_two, parameter)

def freq_eq(x):
    #HMC732 VCO approx equation
 return 0.4794e9*x + 5.874e9

freqs = freq_eq(data[0, 0, 0][:,0])

broths = get_data(0, slide_0, sterile_broth_0, near_sensor)
broths += get_data(0, slide_0, sterile_broth_1, near_sensor)
broths += get_data(0, slide_1, sterile_broth_0, near_sensor)
broths += get_data(0, slide_1, sterile_broth_1, near_sensor)

broths += get_data(1, slide_0, sterile_broth_0, near_sensor)
broths += get_data(1, slide_0, sterile_broth_1, near_sensor)
broths += get_data(1, slide_1, sterile_broth_0, near_sensor)
broths += get_data(1, slide_1, sterile_broth_1, near_sensor)

broths += get_data(2, slide_0, sterile_broth_0, near_sensor)
broths += get_data(2, slide_0, sterile_broth_1, near_sensor)
broths += get_data(2, slide_1, sterile_broth_0, near_sensor)
broths += get_data(2, slide_1, sterile_broth_1, near_sensor)

broths /= np.linalg.norm(broths)

# plt.plot(freqs, broths)

# autoclaved_phages = get_data(0, slide_0, autoclaved_phage_0, near_sensor)
# autoclaved_phages += get_data(0, slide_0, autoclaved_phage_1, near_sensor)
# autoclaved_phages = get_data(0, slide_1, autoclaved_phage_0, near_sensor)
# autoclaved_phages += get_data(0, slide_1, autoclaved_phage_1, near_sensor)
#
# # autoclaved_phages += get_data(1, slide_0, autoclaved_phage_0, near_sensor)
# # autoclaved_phages += get_data(1, slide_0, autoclaved_phage_1, near_sensor)
# autoclaved_phages += get_data(1, slide_1, autoclaved_phage_0, near_sensor)
# autoclaved_phages += get_data(1, slide_1, autoclaved_phage_1, near_sensor)

# autoclaved_phages += get_data(2, slide_0, autoclaved_phage_0, near_sensor)
# autoclaved_phages += get_data(2, slide_0, autoclaved_phage_1, near_sensor)

autoclaved_phages_before = get_data(0, slide_1, autoclaved_phage_0, near_sensor)
autoclaved_phages_before += get_data(0, slide_1, autoclaved_phage_1, near_sensor)

autoclaved_phages_before += get_data(1, slide_1, autoclaved_phage_0, near_sensor)
autoclaved_phages_before += get_data(1, slide_1, autoclaved_phage_1, near_sensor)

# autoclaved_phages_before /= np.linalg.norm(autoclaved_phages_before)


autoclaved_phages = get_data(2, slide_1, autoclaved_phage_0, near_sensor)
autoclaved_phages += get_data(2, slide_1, autoclaved_phage_1, near_sensor)

autoclaved_phages += get_data(3, slide_1, autoclaved_phage_0, near_sensor)
autoclaved_phages += get_data(3, slide_1, autoclaved_phage_1, near_sensor)


# autoclaved_phages /= np.linalg.norm(autoclaved_phages)


# plt.plot(freqs, autoclaved_phages)


phages = get_data(0, slide_0, phage_0, near_sensor)
phages += get_data(0, slide_0, phage_1, near_sensor)
phages += get_data(0, slide_0, phage_2, near_sensor)
phages += get_data(0, slide_0, phage_3, near_sensor)

phages += get_data(0, slide_1, phage_0, near_sensor)
phages += get_data(0, slide_1, phage_1, near_sensor)
phages += get_data(0, slide_1, phage_2, near_sensor)
phages += get_data(0, slide_1, phage_3, near_sensor)

phages += get_data(1, slide_0, phage_0, near_sensor)
phages += get_data(1, slide_0, phage_1, near_sensor)
phages += get_data(1, slide_0, phage_2, near_sensor)
phages += get_data(1, slide_0, phage_3, near_sensor)
phages += get_data(1, slide_1, phage_0, near_sensor)
phages += get_data(1, slide_1, phage_1, near_sensor)
phages += get_data(1, slide_1, phage_2, near_sensor)
phages += get_data(1, slide_1, phage_3, near_sensor)


# phages /= np.linalg.norm(phages)

# plt.plot(freqs, (phages - autoclaved_phages) / autoclaved_phages)


exposed_phages_before = get_data(0, slide_0, phage_0, near_sensor)
exposed_phages_before += get_data(0, slide_0, phage_2, near_sensor)
exposed_phages_before += get_data(0, slide_1, phage_0, near_sensor)
exposed_phages_before += get_data(0, slide_1, phage_2, near_sensor)
exposed_phages_before += get_data(1, slide_0, phage_0, near_sensor)
exposed_phages_before += get_data(1, slide_0, phage_2, near_sensor)
exposed_phages_before += get_data(1, slide_1, phage_0, near_sensor)
exposed_phages_before += get_data(1, slide_1, phage_2, near_sensor)
#
control_phages_before = get_data(0, slide_0, phage_1, near_sensor)
control_phages_before += get_data(0, slide_0, phage_3, near_sensor)
control_phages_before += get_data(0, slide_1, phage_1, near_sensor)
control_phages_before += get_data(0, slide_1, phage_3, near_sensor)
control_phages_before += get_data(1, slide_0, phage_1, near_sensor)
control_phages_before += get_data(1, slide_0, phage_3, near_sensor)
control_phages_before += get_data(1, slide_1, phage_1, near_sensor)
control_phages_before += get_data(1, slide_1, phage_3, near_sensor)

# exposed_phages_before /= np.linalg.norm(exposed_phages_before)
#
# control_phages_before /= np.linalg.norm(control_phages_before)

exposed_phages = get_data(2, slide_0, phage_0, near_sensor)
exposed_phages += get_data(2, slide_0, phage_2, near_sensor)
exposed_phages += get_data(2, slide_1, phage_0, near_sensor)
exposed_phages += get_data(2, slide_1, phage_2, near_sensor)
exposed_phages += get_data(3, slide_0, phage_0, near_sensor)
exposed_phages += get_data(3, slide_0, phage_2, near_sensor)
exposed_phages += get_data(3, slide_1, phage_0, near_sensor)
exposed_phages += get_data(3, slide_1, phage_2, near_sensor)
#
control_phages = get_data(2, slide_0, phage_1, near_sensor)
control_phages += get_data(2, slide_0, phage_3, near_sensor)
control_phages += get_data(2, slide_1, phage_1, near_sensor)
control_phages += get_data(2, slide_1, phage_3, near_sensor)
control_phages += get_data(3, slide_0, phage_1, near_sensor)
control_phages += get_data(3, slide_0, phage_3, near_sensor)
control_phages += get_data(3, slide_1, phage_1, near_sensor)
control_phages += get_data(3, slide_1, phage_3, near_sensor)

# exposed_phages /= np.linalg.norm(exposed_phages)
#
# control_phages /= np.linalg.norm(control_phages)



diff = ((exposed_phages-autoclaved_phages) / autoclaved_phages) - ((control_phages-autoclaved_phages) / autoclaved_phages)
diff_before = ((exposed_phages-autoclaved_phages) / autoclaved_phages) - ((control_phages-autoclaved_phages) / autoclaved_phages)

# plt.plot(freqs,diff)
plt.plot(freqs, ((exposed_phages_before-autoclaved_phages_before) / autoclaved_phages_before) - ((control_phages_before-autoclaved_phages_before) / autoclaved_phages_before))
plt.plot(freqs, ((exposed_phages-autoclaved_phages) / autoclaved_phages) - ((control_phages-autoclaved_phages) / autoclaved_phages))


# plt.plot(freqs, )

# plt.plot(freqs, ((phages - autoclaved_phages_before) / autoclaved_phages_before))


#
# drift_before_after_run = (get_data(1, slide_1, autoclaved_phage_0, near_sensor) - get_data(2, slide_1, autoclaved_phage_1, near_sensor))
#
# plt.plot(freqs, drift_before_after_run / np.linalg.norm(drift_before_after_run))



# there is a significant (probably thermal?) effect from before to after the pulses for all.


# plt.plot(freqs, phages)

# plt.plot(freqs, broths)
# plt.plot(freqs, autoclaved_phages)
# plt.plot(freqs,control_phages,'b')
# plt.plot(freqs,exposed_phages,'r')




plt.savefig("exposed_control_diff.svg")

# plt.plot(get_data(0, slide_0, sterile_broth_0, far_sensor))
# plt.plot(get_data(0, slide_0, sterile_broth_1, far_sensor))
# plt.plot(get_data(0, slide_1, sterile_broth_0, far_sensor))
# plt.plot(get_data(0, slide_1, sterile_broth_1, far_sensor))
#
# plt.plot(get_data(0, slide_0, phage_0, far_sensor))
# plt.plot(get_data(0, slide_0, phage_1, far_sensor))
# plt.plot(get_data(0, slide_0, phage_2, far_sensor))
# plt.plot(get_data(0, slide_0, phage_3, far_sensor))
#
#
# plt.plot(get_data(0, slide_1, phage_0, far_sensor))
# plt.plot(get_data(0, slide_1, phage_1, far_sensor))
# plt.plot(get_data(0, slide_1, phage_2, far_sensor))
# plt.plot(get_data(0, slide_1, phage_3, far_sensor))

# plt.plot(get_data(0, slide_0, phage_0, far_sensor))
# plt.plot(get_data(0, slide_0, phage_1, far_sensor))
# plt.plot(get_data(0, slide_0, phage_2, far_sensor))
# plt.plot(get_data(0, slide_0, phage_3, far_sensor))
#
# plt.plot(get_data(0, slide_0, autoclaved_phage_0, far_sensor), 'r')
# plt.plot(get_data(0, slide_0, autoclaved_phage_1, far_sensor), 'r')
# plt.plot(get_data(0, slide_1, autoclaved_phage_0, far_sensor), 'r')
# plt.plot(get_data(0, slide_1, autoclaved_phage_1, far_sensor), 'r')
#
# plt.plot(get_data(0, slide_0, sterile_broth_0, far_sensor), 'b')
# plt.plot(get_data(0, slide_0, sterile_broth_1, far_sensor), 'b')
# plt.plot(get_data(0, slide_1, sterile_broth_0, far_sensor), 'b')
# plt.plot(get_data(0, slide_1, sterile_broth_1, far_sensor), 'b')
#
# plt.plot(get_data(2, slide_0, autoclaved_phage_0, far_sensor), 'g')
# plt.plot(get_data(2, slide_0, autoclaved_phage_1, far_sensor), 'g')
# plt.plot(get_data(2, slide_1, autoclaved_phage_0, far_sensor), 'g')
# plt.plot(get_data(2, slide_1, autoclaved_phage_1, far_sensor), 'g')
#
# plt.plot(get_data(2, slide_0, sterile_broth_0, far_sensor),'y')
# plt.plot(get_data(2, slide_0, sterile_broth_1, far_sensor),'y')
# plt.plot(get_data(2, slide_1, sterile_broth_0, far_sensor),'y')
# plt.plot(get_data(2, slide_1, sterile_broth_1, far_sensor),'y')
#
# plt.plot(get_data(2, slide_0, phage_0, far_sensor))
# plt.plot(get_data(2, slide_0, phage_1, far_sensor))
# plt.plot(get_data(2, slide_0, phage_2, far_sensor))
# plt.plot(get_data(2, slide_0, phage_3, far_sensor))


#
# plt.plot(freqs, normalized_diff(0, slide_0, phage_1, sterile_broth_0, near_sensor), label="s0p0b0")
# plt.plot(freqs, normalized_diff(0, slide_0, phage_1, sterile_broth_0, far_sensor), label="s0p0b0")
#
# plt.plot(freqs, normalized_diff(0, slide_0, phage_1, sterile_broth_0, near_sensor), label="s0p0b0")
# plt.plot(freqs, normalized_diff(0, slide_0, phage_1, sterile_broth_0, far_sensor), label="s0p0b0")

# plt.plot(freqs, normalized_diff(0, slide_0, phage_1, autoclaved_phage_0, far_sensor)+normalized_diff(0, slide_0, phage_1, autoclaved_phage_0, near_sensor), label="s0p0b0")
# plt.plot(freqs, , label="s0p0b0")?

#
# plt.plot(freqs, normalized_diff(0, slide_0, phage_1, autoclaved_phage_0, near_sensor), label="s0p0b0")
# plt.plot(freqs, normalized_diff(0, slide_0, phage_1, autoclaved_phage_0, far_sensor), label="s0p0b0")

# plt.plot(freqs, normalized_diff(2, slide_0, phage_1, autoclaved_phage_0, near_sensor), label="s0p0b0")
# plt.plot(freqs, normalized_diff(2, slide_0, phage_1, sterile_broth_0, far_sensor), label="s0p0b0")

#
# plt.plot(freqs, normalized_diff(0, slide_0, phage_0, sterile_broth_0, near_sensor), label="s0p0b0")
# plt.plot(freqs, normalized_diff(0, slide_0, phage_0, sterile_broth_0, far_sensor), label="s0p0b0")


#
# plt.plot(freqs, normalized_diff(0, slide_1, phage_0, sterile_broth_0, near_sensor), label="s1p0b0")
# plt.plot(freqs, normalized_diff(0, slide_0, autoclaved_phage_0, sterile_broth_0, far_sensor), label="run 1")
# plt.plot(freqs, normalized_diff(0, slide_1, autoclaved_phage_0, sterile_broth_0, far_sensor), label="run 1")

# plt.plot(freqs, normalized_diff(0, slide_1, phage_1, sterile_broth_0, far_sensor), label="run 1")






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


plt.legend()
plt.show()
