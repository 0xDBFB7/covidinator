from time import sleep
import time
import sys
import serial
from scipy.signal import find_peaks
from matplotlib import pyplot as plt

#arg 1 is serial port, arg 2 is file to append to.

# python -u read_turbidimeter.py /dev/ttyUSB5 phage_experiment_3/


f = open(sys.argv[2], "a")

# import pygame
# import pygame.camera

# pygame.camera.init()
# cam = pygame.camera.Camera("/dev/video0",(640,480))
# cam.start()

# ser = serial.Serial(sys.argv[1], 115200, timeout=5)
multimeter = serial.Serial('/dev/ttyS0',115200,timeout=None)

# cuvette_no = 8


for i in range(0, 8):
    input(f"{i}, enter when ready")
    multimeter.write("val?\r\n".encode())
    value = float(multimeter.readline())
    # ser.reset_input_buffer()
    # ser.readline()
    # ser.readline()
    # value = float(ser.readline())
    f.write("{},{},{}\n".format(time.time(),i,value))
    print(value)
