from time import sleep
import time
import sys
import serial
#arg 1 is serial port, arg 2 is file to append to.

file = open(sys.argv[2], "a")

cuvette_no = 8
with serial.Serial(sys.argv[1], 115200, timeout=5) as ser:
    sleep(2)
    for i in range(0, cuvette_no):
        input(f"Move to cuvette {i} and press enter when ready.")
        ser.readline()#flush
        value = float(ser.readline())
        file.write("{},{},{}".format(time.time(), i, value))
        print(value)
