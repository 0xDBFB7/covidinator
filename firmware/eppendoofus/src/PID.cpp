#include "PID.hpp"



PID::PID(float P_, float I_, float D_, float windup_, float min_output_, float max_output_, unsigned long time){
    //not idiomatic :(
    P = P_;
    I = I_;
    D = D_;
    windup = windup_;
    min_output = min_output_;
    max_output = max_output_;
    previous_time = time;
}

float PID::process_PID(float value, float target_value, unsigned long time){

    float dt = (time-previous_time);
    if(dt == 0){
         debug("Error: 0DIV"); //positively no exception handling!
         return previous_output;
     }
    float error = value-target_value; // ostensibly rollover safe!
    integral = integral + (error*dt);
    float derivative = (error - previous_error)/dt;
    float output = P*error + I*integral + D*derivative;
    integral = constrain(integral,(float) -1.0*windup, windup);

    output = constrain(output, min_output, max_output);

    previous_error = error;
    previous_time = time;

    previous_output = output;

    return output;
}
