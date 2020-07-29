#include "host_comms.hpp"



enum commands { red, green, blue };


void dispatch(){
    if(host_transfer.available()){
        switch(host_transfer.currentPacketID()) {
            case 1: function1(); break;
            case 2: function2(); break;
            case 3: function3(); break;
        }
    }

    if ( == ){
        uint16_t recSize = 0;



}

void loopback(){
    recSize = myTransfer.rxObj(testStruct, recSize);
    Serial.print(testStruct.z);
    Serial.print(testStruct.y);
    Serial.print(" | ");

    recSize = myTransfer.rxObj(arr, recSize);
    Serial.println(arr);
    sendSize = myTransfer.txObj(testStruct, sendSize);

    host_transfer.sendData(sendSize, id);
}
