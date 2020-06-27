#include "WString.h"
#include <string>


#ifdef MOCK_INCLUDES


#else


#endif

#undef constrain

template<class T>
const T& constrain(const T& x, const T& a, const T& b);

std::string WString_to_std_string(String input);


// void compute_max_PWM_freq(){
//     return (CORE_CLOCK_FREQ / analog_write_res)/2
// }
