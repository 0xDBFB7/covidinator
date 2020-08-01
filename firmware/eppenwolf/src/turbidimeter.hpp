#ifndef turbidimeter_H
#define turbidimeter_H

#include <FreqCount.h>
#include "WProgram.h"
#include "comms.hpp"

const int VIS_transmittance_LED_pin = 5;

struct turbidimeter{
    void init();
    // all_off();
    signed long dark_corrected_sample();
    void sample_turbidity();
};

extern turbidimeter turbidimeter_instance;

signed long fast_light_to_freq();


#endif
