import cv2
import numpy as np
from matplotlib import pyplot as plt
import serial

from time import sleep
import time
import sys
from scipy.signal import find_peaks
from matplotlib import pyplot as plt

# background_image = cv2.imread('my_photo-1.jpg',0)
# turbid_img = cv2.imread('my_photo-7.jpg',0)
# turbid_img_2 = cv2.imread('my_photo-8.jpg',0)
# clear_img = cv2.imread('my_photo-9.jpg',0)
# clear_img_2 = cv2.imread('my_photo-10.jpg',0)

#https://stackoverflow.com/questions/48482317/slice-an-image-into-tiles-using-numpy/48483743

# print(np.shape(clear_img))


f = open(sys.argv[2], "a")
ser = serial.Serial(sys.argv[1], 115200, timeout=2)



# detector = cv2.QRCodeDetector()

def blockshaped(arr, nrows, ncols):
    """
    Return an array of shape (n, nrows, ncols) where
    n * nrows * ncols = arr.size

    If arr is a 2D array, the returned array should look like n subblocks with
    each subblock preserving the "physical" layout of arr.
    """
    h, w = arr.shape
    assert h % nrows == 0, "{} rows is not evenly divisble by {}".format(h, nrows)
    assert w % ncols == 0, "{} cols is not evenly divisble by {}".format(w, ncols)
    return (arr.reshape(h//nrows, nrows, -1, ncols)
               .swapaxes(1,2)
               .reshape(-1, nrows, ncols))


while True:

    # while(ser.readline() == ""):
    #     pass
    #
    for x in range(0, 100):



        inp = ser.readline()
        while(inp == b''):
            inp = ser.readline()
            pass
        ser.reset_input_buffer()


        cap = cv2.VideoCapture(0)
        cap.set(3,1280)
        cap.set(4,720)
        cap.set(cv2.CAP_PROP_EXPOSURE,-4)

        ret,img_colored = cap.read()
        img = img_colored[:,:,0]

        cap.release()

        # plt.imshow(img)

        chunks =  blockshaped(img, 144, 160)

        t = []
        for j in chunks:
            i = np.fft.fft2(j)
            t.append(np.linalg.norm(i[:,0:np.shape(i)[1]//4])/np.linalg.norm(i[:,np.shape(i)[1]//4:-1]))

        value = np.max(t)

        flag = cv2.inRange(img_colored, np.array([0, 0, 127]), np.array([50, 50, 255]))#bgR
        plt.imshow(flag, cmap='gray')
        # flag = np.mean(np.ndarray.astype(img_colored[600:-1,:,0],np.float) - np.ndarray.astype(img_colored[600:-1,:,1],np.float) )
        print(np.linalg.norm(flag))

        f.write("{},{},{},{}\n".format(time.time(),int(inp),value,np.linalg.norm(flag)))

        print(value)

        plt.draw()
        plt.pause(0.1)
        plt.clf()



        # if(not ser.readline() == ""):
        #     print("next")
        #     continue


#arg 1 is serial port, arg 2 is file to append to.

# python -u read_turbidimeter.py /dev/ttyUSB5 phage_experiment_3/


# import pygame
# import pygame.camera

# pygame.camera.init()
# cam = pygame.camera.Camera("/dev/video0",(640,480))
# cam.start()

printer = serial.Serial(sys.argv[2], 250000, timeout=100)

# cuvette_no = 8


#     input("Press enter when ready")
#     while(True):
# while(

#remember: 1 is reversed!

# length =

# plt.plot(data)
# plt.show()


    # for k in range(0, 2):
    #     for i in range(0, cuvette_no):
    #         input(f"Move to slide{k}, cuvette {i}, press enter when ready.")
    #         ser.reset_input_buffer()
    #         ser.readline()
    #         value = float(ser.readline())
    #         file.write("{},{},{}\n".format(time.time(), i, value))
    #         print(value)
            # input(f"Move to cuvette {i}, turn light on, press enter when ready.")
            # ser.reset_input_buffer()
            # ser.readline()
            # value = float(ser.readline())
            # file.write("{},{},{},1\n".format(time.time(), i, value))
            # print(value)

            # img = cam.get_image()
            # pygame.image.save(img,f"{sys.argv[2]}/{time.time()}-{k}-{i}.jpg")
