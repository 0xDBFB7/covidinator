
def set_VCO(base_bias_voltage, varactor_voltage, supply_voltage, power_state):
    send_size = 0
    add_float(send_size, base_bias_voltage)
    print(send_size)
    link.send(send_size, packet_id=0)

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

    rec_float_ = link.rx_obj(obj_type=type(float_),
                                     obj_byte_size=float_size,
                                     start_pos=(0))

    clear_buffers()
