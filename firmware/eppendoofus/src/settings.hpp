
#define CORE_CLOCK_FREQ 120e6

#define CORE_SUPPLY_VOLTAGE 3.3

#define ANALOG_WRITE_RESOLUTION 12
//mandated by DAC


#ifdef MOCK_INCLUDES
#else
#define DAC_write analogWrite
#endif
