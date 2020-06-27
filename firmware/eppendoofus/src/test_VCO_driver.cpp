#include "test_VCO_driver.hpp"




void VCO_sense_test_1(){
    TEST_ASSERT_FLOAT_WITHIN(0.001, 3.3, voltage_divider(1.65,1000,1000));
}





void run_VCO_tests(){
    RUN_TEST(VCO_sense_test_1);
}



#ifdef MOCK_INCLUDES

#else

#endif
