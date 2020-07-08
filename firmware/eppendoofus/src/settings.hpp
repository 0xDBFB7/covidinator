

#define CORE_CLOCK_FREQ F_CPU

#define CORE_SUPPLY_VOLTAGE 3.3

#define ANALOG_WRITE_RESOLUTION 12
#define ANALOG_WRITE_MAX_VAL (pow(2,ANALOG_WRITE_RESOLUTION)-1)

//mandated by DAC


#ifdef MOCK_INCLUDES
#else
#define DAC_write analogWrite
#endif




#define MAX_MSG_SIZE  4096
