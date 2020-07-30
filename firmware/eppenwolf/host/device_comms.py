
from pySerialTransfer import pySerialTransfer as txfer

# import messages_pb2
# import PyCmdMessenger
import pyudev

import serial
import sys
import functions
import zlib

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


def connect():
    # HOST_COMM_PORT, DEBUG_PORT = find_devices() ??not working
    HOST_COMM_PORT = '/dev/ttyUSB0'
    link = txfer.SerialTransfer(HOST_COMM_PORT)
    link.open()
    # DEBUG_COMM_INSTANCE = serial.Serial(DEBUG_PORT, 115200)

    return link


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
