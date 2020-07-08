#include "comms.hpp"

void init_debug_comms(){
    debug_serial.begin(115200);
}

void debug_print(String input){
    debug_serial.println(input.c_str());
}

void debug_println(String input){
    debug_serial.print(String(input.c_str()) + "\n");
}



int host_comms_available(){
    return host_serial.available();
}
