#ifndef thermal
#define thermal

#include "MLX90621.h"
#include "comms.hpp"
#include "VCO_driver.hpp"
void init_thermal();

extern MLX90621 thermal_sensor; //no getters for now
float get_max_temp();
#endif
