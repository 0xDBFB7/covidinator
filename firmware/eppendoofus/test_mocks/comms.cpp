#include "comms.hpp"

void print(std::string input){
    std::cout << input;
}

void println(std::string input){
    std::cout << input << "\n";
}


//thanks https://blog.mbedded.ninja/programming/operating-systems/linux/linux-serial-ports-using-c-cpp/!
void init_host_comms(){

    int serial_port = open("/dev/ttyV1", O_RDWR);

    if (serial_port < 0) {
        printf("Error %i from open: %s\n", errno, strerror(errno));
    }

    unsigned char msg[] = { 'H', 'e', 'l', 'l', 'o', '\r' };
    write(serial_port, "Hello, world!", sizeof(msg));

    // Allocate memory for read buffer, set size according to your needs
    char read_buf [256];
    memset(&read_buf, '\0', sizeof(read_buf));

    // Read bytes. The behaviour of read() (e.g. does it block?,
    // how long does it block for?) depends on the configuration
    // settings above, specifically VMIN and VTIME
    int n = read(serial_port, &read_buf, sizeof(read_buf));


    close(serial_port);
}

int host_comms_available(){
    int bytes;
    ioctl(fd, FIONBIO, &bytes);
    printf("Number of bytes = %d\n", bytes);
    return bytes;
}
