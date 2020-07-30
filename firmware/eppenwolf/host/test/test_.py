import sys
sys.path.append('/home/arthurdent/covidinator/firmware/eppendoofus/host/')

import device_comms
from device_comms import *
import pytest
link = device_comms.connect()


def test_loopback():
    send_size = 0
    float_ = 563.5
    send_size += add_float(link, send_size, float_)
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

    rec_float_ = link.rx_obj(obj_type=type(float()),
                                     obj_byte_size=4,
                                     start_pos=(0))

    clear_buffers(link)

    assert rec_float_ == pytest.approx(float_)
    assert link.idByte == 10
