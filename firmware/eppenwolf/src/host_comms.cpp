#include "host_comms.hpp"

SerialTransfer host_transfer;

void init(){
    host_transfer.begin(host_serial);
}



void dispatch(){
    if(host_transfer.available()){
        switch(host_transfer.currentPacketID()) {
            case 0: loopback(); break;
        }
        //screw function pointers!
    }
}



void loopback(){
    uint16_t recSize = 0;

    int t = 0;
    recSize = host_transfer.rxObj(t, recSize);
    debug_serial.print(t);

    uint16_t sendSize = 0;
    sendSize = host_transfer.txObj(t, sendSize);

    host_transfer.sendData(sendSize, 0);
}
