#ifndef HOST_COMMS_H
#define HOST_COMMS_H

#include "comms.hpp"
#include "SerialTransfer.h"
#include "VCO_driver.hpp"
#include "turbidimeter.hpp"
#include "stepper.hpp"

extern SerialTransfer host_transfer;


// #include <CmdMessenger.h>  // CmdMessenger

// extern "C"{
// #include "messages.pb-c.h"
// }

void loopback();

void dispatch();

void set_VCO_handler();

void move();

#endif
