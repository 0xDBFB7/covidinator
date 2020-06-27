#include "test_PID.hpp"


void PID_test_1(){
    desired_val = 0.5;
    pid = PID(1,1,1, 0.5, 0.2, 0.7);
    PID.process_PID();
}

void run_PID_tests(){
    RUN_TEST(PID_test_1);
}
