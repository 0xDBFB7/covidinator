#include "host_comms.hpp"

SerialTransfer host_transfer;



void dispatch(){
    if(host_transfer.available()){
        switch(host_transfer.currentPacketID()) {
            case 0: set_VCO_handler(); break;
            case 1: master_loop(); break;
            // case 1: turbidimeter_instance.sample_turbidity(); break;
            // case 2: move(); break;
            // case 3: home_cmd(); break;
            // case 4: move_absolute_cmd(); break;
            // case 5: move_to_cuvette_cmd(); break;
            // case 6: LO_power_cmd(); break;
            // case 7: LO_tune_cmd(); break;
            // case 8: pulse_cmd(); break;
            // case 9: measure_temperature_cmd(); break;
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

    float varactor_voltage, power_state;
    recSize = host_transfer.rxObj(varactor_voltage, recSize);
    recSize = host_transfer.rxObj(power_state, recSize);

    set_VCO(varactor_voltage,(power_state != 0.0));

    uint16_t sendSize = 0;
    sendSize = host_transfer.txObj(0, sendSize);


    host_transfer.sendData(sendSize, 10);
}

void start_amplifier_cmd(){
    uint16_t recSize = 0;

    float varactor_voltage, power_state;
    recSize = host_transfer.rxObj(varactor_voltage, recSize);

    start_amplifier();

    uint16_t sendSize = 0;
    sendSize = host_transfer.txObj(0, sendSize);


    host_transfer.sendData(sendSize, 10);
}

// void turbidimeter::sample_turbidity(){
//     uint16_t recSize = 0;
//     float t; //always need to read something
//     recSize = host_transfer.rxObj(t, recSize);
//
//     float turbidity_value = turbidimeter_instance.dark_corrected_sample();
//
//     uint16_t sendSize = 0;
//     sendSize = host_transfer.txObj(turbidity_value, sendSize);
//
//     host_transfer.sendData(sendSize, 0);
// }

// void measure_temperature_cmd(){
//
//     uint16_t recSize = 0;
//     float t; //always need to read something
//     recSize = host_transfer.rxObj(t, recSize);
//
//
//     thermal_sensor.measure(true);
//
//     uint16_t sendSize = 0;
//     sendSize = host_transfer.txObj(thermal_sensor.getAmbient(), sendSize);
//     sendSize = host_transfer.txObj(thermal_sensor.getMinTemp(), sendSize);
//     sendSize = host_transfer.txObj(thermal_sensor.getMaxTemp(), sendSize);
//
//     host_transfer.sendData(sendSize, 0);
//
// }

//
// void read_all(){
//     uint16_t recSize = 0;
//
//     float t;
//     recSize = host_transfer.rxObj(t, recSize);
//
//     uint16_t sendSize = 0;
//     sendSize = host_transfer.txObj(0, sendSize);
//
//     host_transfer.sendData(sendSize, 10);
// }
