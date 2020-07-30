#include "host_comms.hpp"

SerialTransfer host_transfer;



void dispatch(){
    if(host_transfer.available()){
        switch(host_transfer.currentPacketID()) {
            case 0: set_VCO_handler(); break;
            case 10: loopback(); break;
        }
        //screw function pointers!
    }
}


void loopback(){
    uint16_t recSize = 0;

    float t = 0;
    recSize = host_transfer.rxObj(t, recSize);
    debug_serial.print(t);

    uint16_t sendSize = 0;
    sendSize = host_transfer.txObj(t, sendSize);

    host_transfer.sendData(sendSize, 10);
}


set_VCO_handler()
