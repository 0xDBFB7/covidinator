
from pySerialTransfer import pySerialTransfer as txfer
# import messages_pb2
# import PyCmdMessenger
import pyudev

import serial
import sys
import functions
import zlib

context = pyudev.Context()




def find_devices():
    #udevadm info -q all -a /dev/ttyUSBX
    DEBUG_PORT = ''
    for device in context.list_devices(subsystem='tty'):
    	if(device["ID_PRODUCT"] ==  "6001"):
    		DEBUG_PORT = device["DEVNAME"]

    print("Debug port: " + DEBUG_PORT)

    HOST_COMM_PORT = ''
    for device in context.list_devices(subsystem='tty'):
    	if(device["ID_PRODUCT"] == "7523"):
    		HOST_COMM_PORT = device["DEVNAME"]

    return HOST_COMM_PORT, DEBUG_PORT


def connect():
    HOST_COMM_PORT, DEBUG_PORT = find_devices();
    link = txfer.SerialTransfer(HOST_COMM_PORT)
    link.open()
    DEBUG_COMM_INSTANCE = serial.Serial(DEBUG_PORT, 115200)

    return link, debug_comm_instance

# def send_command(id, args):
