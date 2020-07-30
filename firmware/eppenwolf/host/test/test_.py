import sys
sys.path.append('/home/arthurdent/covidinator/firmware/eppendoofus/host/')

import device_comms
from device_comms import *
import pytest
link = device_comms.connect()


def test_loopback():
    send_size = 0
    float_ = 563.5
    send_size = add_float(link, send_size, float_)
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

    pos = 0
    val, pos = rx_float(link, pos)

    clear_buffers(link)

    assert val == pytest.approx(float_)
    assert link.idByte == 10
