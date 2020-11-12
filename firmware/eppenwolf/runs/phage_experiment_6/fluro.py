import numpy as np
import matplotlib.pyplot as plt


candidate_names = ["P + G", "PA + G", "PA + W"]


choices = np.array([[0,1,0,0,2,1,0,2],
	[2,1,0,2,0,0,1,0]])


treatment = [[1,1,1,0,0,0,1,1], [1,0,1,1,1,0,1,1]]

slide_0_data = np.genfromtxt(open('fluorescence_slide_0.csv', "r"), delimiter=",", dtype=np.float, encoding='ascii', skip_header=0)
slide_1_data = np.genfromtxt(open('fluorescence_slide_1.csv', "r"), delimiter=",", dtype=np.float, encoding='ascii', skip_header=0)

slide_0_data = slide_0_data[:,1]
slide_1_data = slide_1_data[:,1]

slide_0_data =  np.reshape(slide_0_data, (8,3))
slide_1_data =  np.reshape(slide_1_data, (8,5))

# slide_0_data = np.mean(slide_0_data, axis=1)
# slide_1_data = np.mean(slide_1_data, axis=1)

phage_treated = []
phage_untreated = []

PAG = []
PAW = []

for i in range(0, 7):
        if(choices[0][i] == 0 and treatment[0][i]):
            phage_treated = np.concatenate((phage_treated,slide_0_data[i]))
        if(choices[1][i] == 0 and treatment[1][i]):
            phage_treated = np.concatenate((phage_treated, slide_1_data[i]))

        if(choices[0][i] == 0 and not treatment[0][i]):
            phage_untreated = np.concatenate((phage_untreated,slide_0_data[i]))
        if(choices[1][i] == 0 and not treatment[1][i]):
            phage_untreated = np.concatenate((phage_untreated, slide_1_data[i]))


        if(choices[0][i] == 1):
            PAG = np.concatenate((PAG,slide_0_data[i]))
        if(choices[1][i] == 1):
            PAG = np.concatenate((PAG,slide_1_data[i]))

        if(choices[0][i] == 2):
            PAW = np.concatenate((PAW,slide_0_data[i]))
        if(choices[1][i] == 2):
            PAW = np.concatenate((PAW,slide_1_data[i]))

print(PAW)

plt.scatter(np.ones_like(phage_treated)*0,phage_treated,c='r')

plt.scatter(np.ones_like(phage_untreated)*1,phage_untreated,c='b')
plt.scatter(np.ones_like(PAG)*2,PAG,c='g')
plt.scatter(np.ones_like(PAW)*3,PAW,c='y')

plt.xticks([0,1,2,3],["Treated", "Sham", "Autoclaved", "Control"])

plt.show()
