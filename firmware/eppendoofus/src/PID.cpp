#include "PID.hpp"

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

    PID(float P_, float I_, float D_, float windup_, float min_output_, float max_output_);
    float process_PID(float value, float target_value, unsigned long time);

};

PID::PID(float P_, float I_, float D_, float windup_, float min_output_, float max_output_){
    //not idiomatic :(
    P = P_;
    I = I_;
    D = D_;
    windup = windup_;
    min_output = min_output_;
    max_output = max_output_;

}



float PID::process_PID(float value, float target_value, unsigned long time){
    float dt = (time-previous_time);
    float error = value-target_value; // ostensibly rollover safe!
    integral = integral + (error*dt);
    float derivative = (error - previous_error)/dt;
    float output = P*error + I*integral + D*derivative;
    integral = constrain(integral,(float) -1.0*windup, windup);

    output = constrain(output, min_output, max_output);

    previous_error = error;
    previous_time = time;

    return output;
}
