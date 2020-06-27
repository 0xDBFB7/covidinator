#include "comms.hpp"



void print(std::string input){
    DEBUG_SERIAL.println(input.c_str());
}

void println(std::string input){
    print(input + "\n");
}
