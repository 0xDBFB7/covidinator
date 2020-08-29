#include "settings.hpp"
#include "power_sensor.hpp"

#ifdef MOCK_INCLUDES

#include "mocks.hpp"

#else

#include "WProgram.h"

#endif

#include "Wire.h"

#include "MCP4725.h"

#include "comms.hpp"
#include <WString.h>


void unselect_dacs();
float get_drain_current();

void set_amp_gain_voltage(float gain_voltage);
void set_amp_gate_voltage(float voltage);
void set_amp_power_state(bool power_state);

void init_VCO();
void set_VCO(float varactor_voltage, bool power_state);
void start_amplifier();
void determine_gate_spectrum();
//
// void LO_power(bool power);
// void LO_tune(float target_value);
// void pulse_VCO(int pulse_duration_nanoseconds);
// struct transistor_driver{
//     String name = "";
//
//     int BASE_BIAS_PWM_PIN = 0;
//
//     int SOURCE_PWM_PIN = 0;
//     int PULSE_INPUT_PIN = 0;
//     int SOURCE_FEEDBACK_PIN = 0;
//     int PULSE_FEEDBACK_PIN = 0;
//     int CURRENT_SENSE_PIN = 0;
//
//     void set_base_bias_voltage(float voltage);
//     float get_base_bias_voltage();
//
//     void print(String message);
//     transistor_driver();
// };
//
// struct varactor_driver{
//     String name = "";
//
//     int VARACTOR_INPUT_PIN = 0;
//     int VARACTOR_FEEDBACK_PIN = 0;
//     void set_varactor_voltage(float voltage);
//
//
//     void print(String message);
//     varactor_driver();
// };



//======================
//[ SETTINGS ]
//======================



/*-------------------------------------------*/



/*-------------------------------------------*/
