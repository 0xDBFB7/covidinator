
#define CORE_CLOCK_FREQ 120e6

#define CORE_SUPPLY_VOLTAGE 3.3

#define ANALOG_WRITE_RESOLUTION 12
//mandated by DAC


#ifdef MOCK_INCLUDES
#define DAC_write analogWrite
#else
#include "WProgram.h
#endif
