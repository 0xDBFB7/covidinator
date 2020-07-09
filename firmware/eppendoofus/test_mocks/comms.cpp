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
void Stream::begin(int _){
    if(type == TYPE_DEBUG){ //this is positively inane.
        serial_port = open("/dev/ttyV1", O_RDWR);
        if (serial_port < 0) {
            printf("Error %i from open: %s\n", errno, strerror(errno));
        }

    }
}

void Stream::write(String message){
    ::write(serial_port, message.c_str(), message.length()); //override self.write and use the fcntl write
}

void Stream::write(unsigned char * message, int len){
    ::write(serial_port, message, len); //override self.write and use the fcntl write
}

unsigned char Stream::read(){
    unsigned char read_char = 0;
    ::read(serial_port, &read_char, sizeof(read_char));
    return read_char;
}

int Stream::available(){
    if(type == TYPE_HOST){ //this is positively inane.
        int bytes;
        ioctl(serial_port, FIONBIO, &bytes);
        printf("Number of bytes = %d\n", bytes);
        return bytes;
    }
    else{ //what?
        return 0;
    }
}
