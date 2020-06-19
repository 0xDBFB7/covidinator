#include "VCO_driver.hpp"

struct VCO_driver{
    int VARACTOR_OUTPUT_PIN = 0;
    int VARACTOR_FEEDBACK_PIN = 0;

    int VBASE_BIAS_PWM_PIN = 0;


    int VSOURCE_PWM_PIN = 0;
    int PULSE_INPUT_PIN = 0;
    int VSOURCE_FEEDBACK_PIN = 0;
    int VPULSE_FEEDBACK_PIN = 0;
    int CURRENT_SENSE_PIN = 0;

    void set_base_bias_voltage(float voltage);
    float get_base_bias_voltage();
    VCO_driver();
};

VCO_driver::VCO_driver(){
    analogWriteResolution(ANALOG_WRITE_RESOLUTION);
    pinMode(VARACTOR_OUTPUT_PIN, OUTPUT);
}

void VCO_driver::set_base_bias_voltage(float voltage){
    // I/C = dV/dt
    // dt = 1/frequency
    // I = (Vsupply/R)
    // ripple = ((Vsupply/R)/C)*(1/freq)
    // ((20 V / 1000 ohms) / 10 uF) * (1 / 14 kHz) -> V
    // freq = Vsupply / (C*R*ripple_voltage)
    // 10 uF * 10k = 0.1 s - no prob!

    float duty_cycle = voltage/CORE_SUPPLY_VOLTAGE;

    int max_val = pow(2.0, ANALOG_WRITE_RESOLUTION);

    analogWrite(VBASE_BIAS_PWM_PIN, int(max_val * duty_cycle));
}


float VCO_driver::get_base_bias_voltage(){
    pinMode(VBASE_BIAS_PWM_PIN, INPUT);

    pinMode(VBASE_BIAS_PWM_PIN, OUTPUT);
    return 0;
}

// float VCO_driver::set_source_voltage(){
//
// }






//Ie = Ic + Ib
//Ib = (Vbase_resistor - 0.6v (base voltage)) / Rbase_resistor
