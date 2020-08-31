

#define CORE_CLOCK_FREQ F_CPU

#define CORE_SUPPLY_VOLTAGE 3.3

#define ANALOG_WRITE_RESOLUTION 12
// #define ANALOG_WRITE_MAX_VAL (pow(2,ANALOG_WRITE_RESOLUTION)-1)
#define ANALOG_WRITE_MAX_VAL 4095

//mandated by DAC

#define ANALOG_READ_RESOLUTION 12
#define ANALOG_READ_MAX_VAL 4095



//
// #ifdef MOCK_INCLUDES
// #else
// #define DAC_write analogWrite
// #endif

#define BUTTON_PIN 16

#define DAC_MAX_VAL 4095

// #define MAX_MSG_SIZE  4096

#define HOST_BAUD_RATE 115200
#define DEBUG_BAUD_RATE 115200
