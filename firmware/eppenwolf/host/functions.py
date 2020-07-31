import device_comms
from device_comms import *

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
