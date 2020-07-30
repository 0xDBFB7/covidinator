#include "host_comms.hpp"

SerialTransfer host_transfer;



void dispatch(){
    if(host_transfer.available()){
        debug_serial.println("Packet " + String(host_transfer.currentPacketID()));
        switch(host_transfer.currentPacketID()) {
            case 10: loopback(); break;
        }
        //screw function pointers!
    }
    int t = 0;
    uint16_t sendSize = 0;
    sendSize = host_transfer.txObj(t, sendSize);

    host_transfer.sendData(sendSize, 10);
}


void loopback(){
    uint16_t recSize = 0;

    float t = 0;
    recSize = host_transfer.rxObj(t, recSize);
    debug_serial.print(t);


}
