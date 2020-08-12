#ifndef HOST_COMMS_H
#define HOST_COMMS_H

#include "comms.hpp"
#include "SerialTransfer.h"
#include "VCO_driver.hpp"
#include "turbidimeter.hpp"
#include "stepper.hpp"
#include "thermal.hpp"

extern SerialTransfer host_transfer;


// #include <CmdMessenger.h>  // CmdMessenger

// extern "C"{
// #include "messages.pb-c.h"
// }

void loopback();

void dispatch();

void set_VCO_handler();

void move();
void home_cmd();
void move_absolute_cmd();
void move_to_cuvette_cmd();
void LO_power_cmd();
void LO_tune_cmd();
void pulse_cmd();
void measure_temperature_cmd();

#endif
