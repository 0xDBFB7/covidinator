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





def home(link):
    send_size = 0
    send_size = add_float(link, send_size, 0)
    link.send(send_size, packet_id=3)

    wait_for_response(link)

    pos = 0
    val, pos = rx_float(link, pos)

    clear_buffers(link)


def move_absolute(link, position):
    send_size = 0
    send_size = add_float(link, send_size, position)
    link.send(send_size, packet_id=4)

    wait_for_response(link)

    pos = 0
    val, pos = rx_float(link, pos)

    clear_buffers(link)

    return val

def move_to_cuvette(link, id, function):
    send_size = 0
    send_size = add_float(link, send_size, id)
    send_size = add_float(link, send_size, function)
    link.send(send_size, packet_id=5)

    wait_for_response(link)

    pos = 0
    val, pos = rx_float(link, pos)

    clear_buffers(link)

    return val

def LO_power(link, power):
    send_size = 0
    send_size = add_float(link, send_size, power)
    link.send(send_size, packet_id=6)

    wait_for_response(link)

    pos = 0
    val, pos = rx_float(link, pos)

    clear_buffers(link)

    return val

def LO_tune(link, val):
    send_size = 0
    send_size = add_float(link, send_size, val)
    link.send(send_size, packet_id=7)

    wait_for_response(link)

    pos = 0
    val, pos = rx_float(link, pos)

    clear_buffers(link)

    return val

def varactor_voltage_sweep(link, VCO_supply, start_voltage, end_voltage, step, delay):
    for i in np.arange(start_voltage, end_voltage, step):
        set_VCO(link, 0, i, VCO_supply, 1)
        print(f"Sweeping through {i} V")
        sleep(delay)
