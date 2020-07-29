#ifndef HOST_COMMS_H
#define HOST_COMMS_H

#include "comms.hpp"
#include "SerialTransfer.h"


extern SerialTransfer host_transfer;


// #include <CmdMessenger.h>  // CmdMessenger

// extern "C"{
// #include "messages.pb-c.h"
// }

void loopback();

#endif
