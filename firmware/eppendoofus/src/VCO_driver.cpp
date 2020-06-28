#include "VCO_driver.hpp"

float voltage_divider(float vout, float Rtop, float Rbottom){
    return (vout/(Rbottom/(Rtop+Rbottom)));
}

void transistor_driver::print(std::string message){
}


transistor_driver::transistor_driver(){
    //split up because the preamp is just a bare transistor
    analogWriteResolution(ANALOG_WRITE_RESOLUTION);
    pinMode(VBASE_BIAS_PWM_PIN, OUTPUT);
    analogWrite(VBASE_BIAS_PWM_PIN, 0);
}



void transistor_driver::set_base_bias_voltage(float voltage){
    //freqs: https://www.pjrc.com/teensy/td_pulse.html
    //with 10 uF and 10k,
    //(3.3 V / 10000 ohms )/10 uF * 1 / 14.6e3 Hz -> V = 0.0022 v
    //of ripple - 0.226% at 1v. That should be sufficient.
    //otherwise, we can probably increase that to 50 or 100k.
    (*this).print("");

    if(voltage > CORE_SUPPLY_VOLTAGE || voltage < 0){
        //????
        run_abort("improper voltage");
        return;
    }

    float value = (voltage/CORE_SUPPLY_VOLTAGE);

    analogWrite(VBASE_BIAS_PWM_PIN, value);

    (*this).print("Updated base bias.");
}


struct VCO_driver{
    int VARACTOR_OUTPUT_PIN = 0;
    int VARACTOR_FEEDBACK_PIN = 0;





    std::string name = "";

    VCO_driver();
    void varactor_feedback_voltage();
    void set_tuning_varactor_voltage(float voltage);
};

VCO_driver::VCO_driver(){
    analogWriteResolution(ANALOG_WRITE_RESOLUTION);
    pinMode(VARACTOR_OUTPUT_PIN, OUTPUT);
}

// void VCO_driver::set_base_bias_voltage(float voltage){
//     // I/C = dV/dt
//     // dt = 1/frequency
//     // I = (Vsupply/R)
//     // ripple = ((Vsupply/R)/C)*(1/freq)
//     // ((20 V / 1000 ohms) / 10 uF) * (1 / 14 kHz) -> V
//     // freq = Vsupply / (C*R*ripple_voltage)
//
//
//
//     float duty_cycle = voltage/CORE_SUPPLY_VOLTAGE;
//
//     int max_val = pow(2.0, ANALOG_WRITE_RESOLUTION);
//
//     analogWrite(VBASE_BIAS_PWM_PIN, int(max_val * duty_cycle));
//
//     print("Base bias voltage changed to " + str(voltage));
// }
//
//
// float VCO_driver::get_base_bias_voltage(){
//     pinMode(VBASE_BIAS_PWM_PIN, INPUT);
//
//     pinMode(VBASE_BIAS_PWM_PIN, OUTPUT);
//     return 0;
// }

void VCO_driver::varactor_feedback_voltage(){

}
//
// void VCO_driver::generate_varactor_tuning_table_checks(){
//     DAC_write(VARACTOR_OUTPUT_PIN);
// }
//
// void VCO_driver::generate_varactor_tuning_table(){
//     ////////////////CHECKS/////////////////
//     generate_varactor_tuning_table_checks();
//
// }

void VCO_driver::set_tuning_varactor_voltage(float voltage){

    // DAC_write();

}

// float VCO_driver::set_source_voltage(){
//
// }






//Ie = Ic + Ib
//Ib = (Vbase_resistor - 0.6v (base voltage)) / Rbase_resistor
