import sys
sys.path.append('/home/arthurdent/covidinator/firmware/eppendoofus/host/')

import device_comms

link = device_comms.connect()


def test_loopback():
    send_size = 0
    float_ = 563.5
    float_size = link.tx_obj(float_, send_size) - send_size
    send_size += float_size
    link.send(send_size, packet_id=10)

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
                                     start_pos=(list_size + str_size))
    assert link.idByte == 10
