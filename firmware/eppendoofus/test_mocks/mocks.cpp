#include "mocks.hpp"

#define NUM_PINS 100



std::vector<bool> pin_modes(NUM_PINS); //global state! Probably a good idea to make a wrapper class around GPIOs...
std::vector<bool> pin_states(NUM_PINS);
std::vector<int> analog_values(NUM_PINS);


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

void reset_mocks(){
    std::fill(pin_modes.begin(), pin_modes.end(), 0);
    std::fill(pin_states.begin(), pin_states.end(), 0);
    std::fill(analog_values.begin(), analog_values.end(), 0);
}
