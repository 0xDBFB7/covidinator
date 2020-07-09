
# from pySerialTransfer import pySerialTransfer as txfer
# import messages_pb2
import pyudev
import PyCmdMessenger
import serial
import sys

context = pyudev.Context()

commands = [["VCO_set",""],
            ["VCO_status","s"]
            ["REPLY","i"]


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
    return PyCmdMessenger.ArduinoBoard(HOST_COMM_PORT, baud_rate=115200, int_bytes=4,long_bytes=4, float_bytes=4, double_bytes=8)





#
# def get_link():
#     HOST_COMM_PORT, DEBUG_PORT = find_devices();
#     link = txfer.SerialTransfer(HOST_COMM_PORT)
#     link.open()
#
#     return link
#
# def send_message(link):
#
#     serialized_protobuf = SerializeToString()
#     size = link.tx_obj(serialized_protobuf)
#
#     link.send(size)
#
#
#
# def recieve_message(link):
#     print("Waiting for message")
#     while not link.available() and t:
#         if link.status < 0:
#             if link.status == txfer.CRC_ERROR:
#                 print('ERROR: CRC_ERROR')
#             elif link.status == txfer.PAYLOAD_ERROR:
#                 print('ERROR: PAYLOAD_ERROR')
#             elif link.status == txfer.STOP_BYTE_ERROR:
#                 print('ERROR: STOP_BYTE_ERROR')
#             else:
#                 print('ERROR: {}'.format(link.status))
#
#
#     rec_str_   = link.rx_obj(obj_type=type(str_),
#                              obj_byte_size=str_size,
#                              start_pos=list_size)
