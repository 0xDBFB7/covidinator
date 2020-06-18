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

    float duty_cycle = 0;
}

void VCO_driver::set_oscillator_bias(float voltage){
    // I/C = dV/dt
    // dt = 1/frequency
    // I = (Vsupply/R)
    // ripple = ((Vsupply/R)/C)*(1/freq)
    // ((20 V / 1000 ohms) / 10 uF) * (1/ 14 kHz) -> V

    duty_cycle = voltage/3.3;
    analogWriteFrequency(4, 375000);
    analogWrite(VBIAS_PWM_PIN, duty_cycle);
}


//Ie = Ic + Ib
//Ib = (Vbase_resistor - 0.6v (base voltage)) / Rbase_resistor
