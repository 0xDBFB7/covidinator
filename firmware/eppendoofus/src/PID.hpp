
#include "helpers.hpp"
#include <stdexcept>
#include <WString.h>
#include <debug_helpers.hpp>


struct PID{

    float P = 0;
    float I = 0;
    float D = 0;

    float integral = 0;
    float previous_error = 0;

    float min_output = 0;
    float max_output = 0;
    float windup = 0;
    unsigned long previous_time = 0;

    float previous_output = 0;

    PID(float P_, float I_, float D_, float windup_, float min_output_, float max_output_, unsigned long time);
    float process_PID(float value, float target_value, unsigned long time);

};
