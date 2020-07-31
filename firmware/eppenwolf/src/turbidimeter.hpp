#include <FreqCount.h>
#include "WProgram.h"



struct turbidimeter{
    void init();
    // all_off();
    signed long dark_corrected_sample();
};

extern turbidimeter turbidimeter_instance;
