#include "test_VCO_driver.hpp"

#include "unity.h"


void setUp(void) {
    // set stuff up here
}

void tearDown(void) {
    // clean stuff up here
}


void VCO_test_1(){

    TEST_ASSERT_FLOAT_WITHIN(0.1, 0.1, 0.1);
}





void run_VCO_tests(){
    RUN_TEST(VCO_test_1);
}



#ifdef MOCK_INCLUDES
#else
#endif
