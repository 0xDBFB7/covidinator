#include "host_comms.hpp"

SerialTransfer host_transfer;



void dispatch(){
    if(host_transfer.available()){
        switch(host_transfer.currentPacketID()) {
            case 0: set_VCO_handler(); break;
            case 1: turbidimeter_instance.sample_turbidity(); break;
            case 2: move(); break;
            case 3: home_cmd(); break;
            case 4: move_absolute_cmd(); break;
            case 5: move_to_cuvette_cmd(); break;
            case 6: LO_power_cmd(); break;
            case 7: LO_tune_cmd(); break;
            case 8: pulse_cmd(); break;
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

    uint16_t sendSize = 0;
    sendSize = host_transfer.txObj(0, sendSize);


    host_transfer.sendData(sendSize, 10);
}

void turbidimeter::sample_turbidity(){
    uint16_t recSize = 0;
    float t; //always need to read something
    recSize = host_transfer.rxObj(t, recSize);

    float turbidity_value = turbidimeter_instance.dark_corrected_sample();

    uint16_t sendSize = 0;
    sendSize = host_transfer.txObj(turbidity_value, sendSize);

    host_transfer.sendData(sendSize, 0);
}

void move(){
    uint16_t recSize = 0;
    float direction;
    recSize = host_transfer.rxObj(direction, recSize);
    float step;
    recSize = host_transfer.rxObj(step, recSize);

    move_relative(direction, step);

    uint16_t sendSize = 0;
    sendSize = host_transfer.txObj(0, sendSize);
    host_transfer.sendData(sendSize, 0);
}

void move_absolute_cmd(){
    uint16_t recSize = 0;
    float position;
    recSize = host_transfer.rxObj(position, recSize);

    move_absolute(position);

    uint16_t sendSize = 0;
    sendSize = host_transfer.txObj(0, sendSize);
    host_transfer.sendData(sendSize, 0);
}

void move_to_cuvette_cmd(){
    uint16_t recSize = 0;
    float id;
    float function;
    recSize = host_transfer.rxObj(id, recSize);
    recSize = host_transfer.rxObj(function, recSize);

    move_to_cuvette(id, function);

    uint16_t sendSize = 0;
    sendSize = host_transfer.txObj(0, sendSize);
    host_transfer.sendData(sendSize, 0);
}

void home_cmd(){
    uint16_t recSize = 0;
    float t; //always need to read something
    recSize = host_transfer.rxObj(t, recSize);

    home();

    uint16_t sendSize = 0;
    sendSize = host_transfer.txObj(0, sendSize);

    host_transfer.sendData(sendSize, 0);
}

void LO_power_cmd(){
    uint16_t recSize = 0;
    float lo_power;
    recSize = host_transfer.rxObj(lo_power, recSize);

    LO_power(lo_power);

    uint16_t sendSize = 0;
    sendSize = host_transfer.txObj(0, sendSize);

    host_transfer.sendData(sendSize, 0);
}


void LO_tune_cmd(){
    uint16_t recSize = 0;
    float lo_tune; //always need to read something
    recSize = host_transfer.rxObj(lo_tune, recSize);

    LO_tune(lo_tune);

    uint16_t sendSize = 0;
    sendSize = host_transfer.txObj(0, sendSize);

    host_transfer.sendData(sendSize, 0);
}



void pulse_cmd(){
    uint16_t recSize = 0;
    float pulse_nanoseconds; //always need to read something
    recSize = host_transfer.rxObj(pulse_nanoseconds, recSize);

    pulse_VCO(pulse_nanoseconds);

    uint16_t sendSize = 0;
    sendSize = host_transfer.txObj(0, sendSize);

    host_transfer.sendData(sendSize, 0);
}



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
