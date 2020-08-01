import device_comms
from device_comms import *

position = 0

def set_VCO(link, base_bias_voltage, varactor_voltage, supply_voltage, power_state):
    send_size = 0
    send_size = add_float(link, send_size, base_bias_voltage)
    send_size = add_float(link, send_size, varactor_voltage)
    send_size = add_float(link, send_size, supply_voltage)
    send_size = add_float(link, send_size, power_state)

    link.send(send_size, packet_id=0)

    wait_for_response(link)

    pos = 0
    val, pos = rx_float(link, pos)

    clear_buffers(link)


def sample_turbidity(link):
    send_size = 0
    send_size = add_float(link, send_size, 0)
    link.send(send_size, packet_id=1)

    wait_for_response(link)

    pos = 0
    val, pos = rx_float(link, pos)

    clear_buffers(link)

    return val

def move_relative(link, direction, distance):
    send_size = 0
    send_size = add_float(link, send_size, direction)
    send_size = add_float(link, send_size, distance)
    link.send(send_size, packet_id=2)

    wait_for_response(link)

    pos = 0
    val, pos = rx_float(link, pos)

    clear_buffers(link)

    return val

def home():
    global position
    position = 0
    move_relative(0, 80)
