from time import sleep
import time
import sys
import serial

#arg 1 is serial port, arg 2 is file to append to.

# python -u read_turbidimeter.py /dev/ttyUSB5 slide_0_turbidity.csv

# file = open(sys.argv[2], "a")

import pygame
import pygame.camera

pygame.camera.init()
cam = pygame.camera.Camera("/dev/video0",(640,480))
cam.start()

cuvette_no = 8
with serial.Serial(sys.argv[1], 115200, timeout=5) as ser:
    for k in range(0, 2):
        for i in range(0, cuvette_no):
            input(f"Move to slide{k}, cuvette {i}, press enter when ready.")
            ser.reset_input_buffer()
            ser.readline()
            value = float(ser.readline())
            file.write("{},{},{}\n".format(time.time(), i, value))
            print(value)
            # input(f"Move to cuvette {i}, turn light on, press enter when ready.")
            # ser.reset_input_buffer()
            # ser.readline()
            # value = float(ser.readline())
            # file.write("{},{},{},1\n".format(time.time(), i, value))
            # print(value)

            # img = cam.get_image()
            # pygame.image.save(img,f"{sys.argv[2]}/{time.time()}-{k}-{i}.jpg")
