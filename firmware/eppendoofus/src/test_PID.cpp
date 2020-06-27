#include "test_PID.hpp"


void PID_test_1(){
    PID pid = PID(1,1,1, 0.5, 0.2, 0.7, 0);
    float output = pid.process_PID(0, 0, 1);
    TEST_ASSERT_FLOAT_WITHIN(0.01, 0.2, output);
}

void run_PID_tests(){
    RUN_TEST(PID_test_1);
}
