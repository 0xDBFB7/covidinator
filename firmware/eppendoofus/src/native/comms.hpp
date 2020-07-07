#include <string>
#include "WProgram.h"
#include "settings.hpp"

#define DEBUG_SERIAL Serial1
#define HOST_SERIAL Serial2


void print(std::string input);

void println(std::string input);

int host_comms_available();
void init_host_comms();
void init_debug_comms();
