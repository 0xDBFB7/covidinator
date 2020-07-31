#ifndef turbidimeter_H
#define turbidimeter_H

#include <FreqCount.h>
#include "WProgram.h"



struct turbidimeter{
    void init();
    // all_off();
    signed long dark_corrected_sample();
    void sample_turbidity();
};

extern turbidimeter turbidimeter_instance;

#endif
