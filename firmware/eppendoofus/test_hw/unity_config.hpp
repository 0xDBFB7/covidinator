#include "RS232_header.h"
...
#define UNITY_OUTPUT_CHAR(a)    RS232_putc(a)
#define UNITY_OUTPUT_START()    RS232_config(115200,1,8,0)
#define UNITY_OUTPUT_FLUSH()    RS232_flush()
#define UNITY_OUTPUT_COMPLETE() RS232_close()
