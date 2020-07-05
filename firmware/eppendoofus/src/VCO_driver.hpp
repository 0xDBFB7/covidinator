#include "settings.hpp"

#ifdef MOCK_INCLUDES

#include "mocks.hpp"

#else
#endif



#include "except.hpp"
#include "WProgram.h"
#include <string>
#include <WString.h>


struct transistor_driver{
    std::string name = "";

    int VBASE_BIAS_PWM_PIN = 0;

    int VSOURCE_PWM_PIN = 0;
    int PULSE_INPUT_PIN = 0;
    int VSOURCE_FEEDBACK_PIN = 0;
    int VPULSE_FEEDBACK_PIN = 0;
    int CURRENT_SENSE_PIN = 0;

    void set_base_bias_voltage(float voltage);
    float get_base_bias_voltage();

    void print(std::string message);
    transistor_driver();
};





float voltage_divider(float vout, float Rtop, float Rbottom);



//======================
//[ SETTINGS ]
//======================



/*-------------------------------------------*/



/*-------------------------------------------*/
