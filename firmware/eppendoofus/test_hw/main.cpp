#include "WProgram.h"

// OpenHTF could be a viable alternative to this.
#include "unity.h"

#include "test_VCO_driver.hpp"



int main(void){

    UNITY_BEGIN();

    run_VCO_tests();

    return UNITY_END();



}
