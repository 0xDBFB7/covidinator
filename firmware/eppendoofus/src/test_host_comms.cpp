#include "test_host_comms.hpp"


void test_host_comms_init(){
    host_serial.begin();
}

void run_host_comms_tests(){
    RUN_TEST(test_host_comms_init);
}
