#include "host_comms.hpp"

void init(){
    host_transfer.begin(host_serial);
}

void dispatch(){
    if(host_transfer.available()){
        switch(host_transfer.currentPacketID()) {
            case 0: loopback(); break;
            case 1: function2(); break;
            case 2: function3(); break;
        }
        //screw function pointers!
    }
}

void loopback(){
    int t = 0;
    recSize = myTransfer.rxObj(t, recSize);
    debug_serial.print(t);

    recSize = myTransfer.rxObj(arr, recSize);


    sendSize = myTransfer.txObj(testStruct, sendSize);

    host_transfer.sendData(sendSize, 0);


}
