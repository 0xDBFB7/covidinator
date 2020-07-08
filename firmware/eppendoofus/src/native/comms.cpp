#include "comms.hpp"

void init_debug_comms(){
    DEBUG_SERIAL.begin(115200);
}

void print(std::string input){
    DEBUG_SERIAL.println(input.c_str());
}

void println(std::string input){
    print(input + "\n");
}



int host_comms_available(){
    return HOST_SERIAL.available();
}
