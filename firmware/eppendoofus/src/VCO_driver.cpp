#include "VCO_driver.hpp"

struct VCO_driver{
    int VARACTOR_PWM_PIN = 0;
    int VARACTOR_FEEDBACK_PIN = 0;

    int VBIAS_PWM_PIN = 0;
    

    int VSOURCE_PWM_PIN = 0;
    int PULSE_INPUT_PIN = 0;
    int VSOURCE_FEEDBACK_PIN = 0;
    int VPULSE_FEEDBACK_PIN = 0;
    int CURRENT_SENSE_PIN = 0;

}

void VCO_driver::set_oscillator_bias(float voltage){
    duty_cycle = voltage/3.3;
    analogWrite(duty_cycle
}


//Ie = Ic + Ib
//Ib = (Vbase_resistor - 0.6v (base voltage)) / Rbase_resistor
