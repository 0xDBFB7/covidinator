from time import sleep
import time
import sys
import serial
from scipy.signal import find_peaks
from matplotlib import pyplot as plt

#arg 1 is serial port, arg 2 is file to append to.

# python -u read_turbidimeter.py /dev/ttyUSB5 phage_experiment_3/


f = open(sys.argv[3] + "slides.csv", "a")

# import pygame
# import pygame.camera

# pygame.camera.init()
# cam = pygame.camera.Camera("/dev/video0",(640,480))
# cam.start()

ser = serial.Serial(sys.argv[1], 115200, timeout=5)

# cuvette_no = 8


#     input("Press enter when ready")
#     while(True):
# while(

#remember: 1 is reversed!

# length =

printer.write(b"G161 X\nM17\nG0 X0\n")
printer.readline()
printer.reset_input_buffer()
ser.readline()

for k in range(0, 2):
    # printer.write("M114\n".encode())
    # print(printer.readline())
    input(f"Slide, face {k}")
    printer.reset_input_buffer()
    # G161 X Y Z
    printer.write(b"M17\n G0 X0\n")
    printer.readline()
    printer.write(b"G1 X74 F200\n")
    printer.readline() #ok
    printer.write(b"M400\n") # wait for fin of move
    ser.reset_input_buffer()
    while(True):
        value = float(ser.readline())
        f.write("{},{},{}\n".format(time.time(),k,value))
        print(value)
        print(printer.in_waiting)
        if(printer.in_waiting >= 6):
            break
    printer.write(b"G0 X0 F1000\n")
    printer.readline()
    printer.write(b"M400\n") # wait for fin of move
    printer.readline()

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
