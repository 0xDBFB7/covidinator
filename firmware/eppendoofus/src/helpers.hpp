#include "WString.h"
#include <string>
#include "base64.h"

#ifdef MOCK_INCLUDES


#else


#endif

#undef constrain

// template<class T>
// const T& constrain(const T& x, const T& a, const T& b);
float constrain(float x, float a, float b);


std::string WString_to_std_string(String input);

float voltage_divider(float vout, float Rtop, float Rbottom);


// void compute_max_PWM_freq(){
//     return (CORE_CLOCK_FREQ / analog_write_res)/2
// }
