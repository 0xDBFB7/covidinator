#include "test_PID.hpp"


void PID_test_1(){
    for(int i = 0; i < 100; i++){
        TEST_ASSERT_FLOAT_WITHIN(0.1, 0.1, 0.1);
    }
}

void run_PID_tests(){
    RUN_TEST(PID_test_1);
}
