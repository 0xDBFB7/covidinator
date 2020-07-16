#include "settings.hpp"

#ifdef MOCK_INCLUDES

#include "mocks.hpp"

#else

#include "WProgram.h"

#endif



#include "except.hpp"
#include <WString.h>


struct transistor_driver{
    String name = "";

    int BASE_BIAS_PWM_PIN = 0;

    int SOURCE_PWM_PIN = 0;
    int PULSE_INPUT_PIN = 0;
    int SOURCE_FEEDBACK_PIN = 0;
    int PULSE_FEEDBACK_PIN = 0;
    int CURRENT_SENSE_PIN = 0;

    void set_base_bias_voltage(float voltage);
    float get_base_bias_voltage();

    void print(String message);
    transistor_driver();
};

struct varactor_driver{
    String name = "";

    int VARACTOR_INPUT_PIN = 0;
    int VARACTOR_FEEDBACK_PIN = 0;
    void set_varactor_voltage(float voltage);


    void print(String message);
    varactor_driver();
};



//======================
//[ SETTINGS ]
//======================



/*-------------------------------------------*/



/*-------------------------------------------*/