#include "test_host_comms.hpp"


void test_host_comms_init(){
    init_host_comms();
}

void run_host_comms_tests(){
    RUN_TEST(test_host_comms_init);
}
