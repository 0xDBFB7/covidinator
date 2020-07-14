#include "test_host_comms.hpp"


void test_host_comms_init(){
    host_serial.begin(HOST_BAUD_RATE);
}

void run_host_comms_tests(){
    RUN_TEST(test_host_comms_init);
}
