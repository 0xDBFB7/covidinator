
struct PID{

    float P = 0;
    float I = 0;
    float D = 0;

    float integral = 0;
    float previous_error = 0;

    unsigned long previous_time = 0;

    PID(float P_, float I_, float D_);
};

PID::PID(float P_, float I_, float D_, float windup, float ){
    P = P_;
    I = I_;
    D = D_;
}



float process_PID(float value, float target_value, long time){

    float timestep = 1.0/cycles_per_second;
    float error =  waterlevel-target_waterlevel;
    integral = integral + error*timestep;
    float derivative = (error - previous_error)/timestep;
    float required_pump_duty = flash_values[DC_P_CONST]*error + flash_values[DC_I_CONST]*integral + flash_values[DC_D_CONST]*derivative; //13,0.2,0.5 works okay. 20,0.4,0.5 works pretty well. 40,1.5,1 is twitchy.
    previous_error = error;
    integral = constrain(integral,200.0/-1.5,200/1.5);
    required_pump_duty = constrain(required_pump_duty,0,200);

    return required_pump_duty;
}
