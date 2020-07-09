#ifndef COMMS_H
#define COMMS_H

#include <string>
#include "WString.h"
#include <iostream>
#include <fcntl.h>       /* File control definitions */
#include <sys/ioctl.h>   /* Serial Port IO Controls */
#include <unistd.h>

#include <cstdio>
#include <cstdlib>
#include <fcntl.h>
#include <string>
#include <sys/ioctl.h>
#include <termios.h>
#include <unistd.h>

std::string WString_to_std_string(String input);

#define TYPE_HOST 0
#define TYPE_DEBUG 1

struct Stream{
    bool type = 0;
    int serial_port = 0;
    void write(String message);
    void write(unsigned char * message, int len);

    int available();
    void begin(int _);
    void print(String input);
    void println(String input);
    void close();
    unsigned char read();
    Stream(bool type);
};

extern Stream debug_serial;
extern Stream host_serial;

#define Serial debug_serial

#endif
