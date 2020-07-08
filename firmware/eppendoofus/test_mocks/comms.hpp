#ifndef COMMS_H
#define COMMS_H

#include <string>
#include "WString.h"
#include <iostream>
#include <fcntl.h>       /* File control definitions */
#include <sys/ioctl.h>   /* Serial Port IO Controls */
#include <unistd.h>

std::string WString_to_std_string(String input);

#define TYPE_HOST 0
#define TYPE_DEBUG 1

struct Stream{
    bool type = 0;
    void write();
    int available();
    void begin();
    void print(String input);
    void println(String input);
    void close();
    Stream(bool type);
};

extern Stream debug_serial;
extern Stream host_serial;

#define Serial debug_serial

#endif
