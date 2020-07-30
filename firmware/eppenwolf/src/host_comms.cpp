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


void set_VCO_handler(){
    uint16_t recSize = 0;

    float base_bias_voltage, varactor_voltage, supply_voltage, power_state;
    recSize = host_transfer.rxObj(base_bias_voltage, recSize);
    recSize = host_transfer.rxObj(varactor_voltage, recSize);
    recSize = host_transfer.rxObj(supply_voltage, recSize);
    recSize = host_transfer.rxObj(power_state, recSize);

    set_VCO(base_bias_voltage, varactor_voltage, supply_voltage, (power_state != 0.0));
    printf("VCO set to %f, %f, %f, %i\n", base_bias_voltage, varactor_voltage, supply_voltage, (power_state != 0.0));

    uint16_t sendSize = 0;
    sendSize = host_transfer.txObj(0, sendSize);

    host_transfer.sendData(sendSize, 10);
}
