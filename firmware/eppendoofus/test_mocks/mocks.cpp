#include "mocks.hpp"

#define NUM_PINS 100



bool pin_modes[NUM_PINS] = {0}; //global state! Probably a good idea to make a wrapper class around GPIOs...
bool pin_states[NUM_PINS] = {0};

int analog_values[NUM_PINS] = {0};


void pinMode(int pin, bool mode){
    pin_modes[pin] = mode;
}

void digitalWriteFast(int pin, bool state){
    pin_states[pin] = state;
}

bool digitalReadFast(int pin){
    return pin_states[pin];
}

void delay(int ms){

}

void analogWrite(int pin, int value){
    analog_values[pin] = value;
}
