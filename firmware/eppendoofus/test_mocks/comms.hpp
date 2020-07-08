#include <string>
#include "WString.h"
#include <iostream>
#include <fcntl.h>       /* File control definitions */
#include <sys/ioctl.h>   /* Serial Port IO Controls */
#include <unistd.h>

void print(std::string input);

void println(std::string input);

void init_host_comms();

int host_comms_available();

std::string WString_to_std_string(String input);
