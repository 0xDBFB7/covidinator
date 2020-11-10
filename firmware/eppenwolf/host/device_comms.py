
from pySerialTransfer import pySerialTransfer as txfer

# import messages_pb2
# import PyCmdMessenger
import pyudev

import serial
import sys
import zlib
import numpy as np
from time import sleep
context = pyudev.Context()
#
# def find_devices():
#     #udevadm info -q all -a /dev/ttyUSBX
#     DEBUG_PORT = ''
#     for device in context.list_devices(subsystem='tty'):
#         print(device.get("ID_MODEL"))
#         if(device.get("ID_PRODUCT") == "7523"):
#     	       DEBUG_PORT = device["DEVNAME"]
#
#     print("Debug port: " + DEBUG_PORT)
#
#     HOST_COMM_PORT = ''
#     for device in context.list_devices(subsystem='tty'):
#     	if(device.get("ID_PRODUCT") == "6001"):
#     		HOST_COMM_PORT = device["DEVNAME"]
#
#     return HOST_COMM_PORT, DEBUG_PORT

multimeter = serial.Serial('/dev/ttyS0',115200,timeout=None)


def connect():
    # HOST_COMM_PORT, DEBUG_PORT = find_devices() ??not working
    HOST_COMM_PORT = '/dev/ttyUSB3'
    link = txfer.SerialTransfer(HOST_COMM_PORT)
    link.open()
    # DEBUG_COMM_INSTANCE = serial.Serial(DEBUG_PORT, 115200)

    return link

def wait_for_response(link):
    while not link.available():
        if link.status < 0:
            if link.status == txfer.CRC_ERROR:
                print('ERROR: CRC_ERROR')
            elif link.status == txfer.PAYLOAD_ERROR:
                print('ERROR: PAYLOAD_ERROR')
            elif link.status == txfer.STOP_BYTE_ERROR:
                print('ERROR: STOP_BYTE_ERROR')
            else:
                print('ERROR: {}'.format(link.status))


def add_float(link, send_size, val):
    float_size = link.tx_obj(float(val), send_size) - send_size
    return send_size + float_size


def rx_float(link, position):
    value = link.rx_obj(obj_type=type(float()),
                                     obj_byte_size=4,
                                     start_pos=(0))
    return value, position + 4


def clear_buffers(link):
    link.txBuff = [' ' for i in range(txfer.MAX_PACKET_SIZE - 1)]
    link.rxBuff = [' ' for i in range(txfer.MAX_PACKET_SIZE - 1)]
