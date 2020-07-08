#include "comms.hpp"

Stream debug_serial(TYPE_DEBUG);
Stream host_serial(TYPE_HOST);

void debug_print(String input){
    std::cout << input;
}

void debug_println(String input){
    std::cout << input << "\n";
}

std::string WString_to_std_string(String input){
    std::string output = input.c_str();
    return output;
}

Stream::Stream(bool type){
    type = type;
}

//thanks https://blog.mbedded.ninja/programming/operating-systems/linux/linux-serial-ports-using-c-cpp/!
void Stream::begin(){
    if(type == TYPE_DEBUG){ //this is positively inane.
        int serial_port = open("/dev/ttyV1", O_RDWR);

        if (serial_port < 0) {
            printf("Error %i from open: %s\n", errno, strerror(errno));
        }

        unsigned char msg[] = { 'H', 'e', 'l', 'l', 'o', '\r' };
        write(serial_port, "Hello, world!", sizeof(msg));
    }
}

void Stream::read(){
    char read_buf [256];
    memset(&read_buf, '\0', sizeof(read_buf));
    int n = read(serial_port, &read_buf, sizeof(read_buf));
}

int Stream::available(){
    if(type == TYPE_HOST){ //this is positively inane.
        int bytes;
        ioctl(fd, FIONBIO, &bytes);
        printf("Number of bytes = %d\n", bytes);
        return bytes;
    }
    else{ //what?
    }
}
