import sys
sys.path.append('/home/arthurdent/covidinator/firmware/eppendoofus/host/')

import device_comms
from device_comms import *
import pytest
from functions import *
link = device_comms.connect()


def test_loopback():
    send_size = 0
    float_ = 563.5
    send_size = add_float(link, send_size, float_)
    link.send(send_size, packet_id=10)

    wait_for_response(link)

    pos = 0
    val, pos = rx_float(link, pos)

    clear_buffers(link)

    assert val == pytest.approx(float_)
    assert link.idByte == 10


def test_VCO_driver():
    set_VCO(link, 3, 2, 1, 0);
#
def test_turbidimeter():
    set_VCO(link, 3, 2, 1, 0);
