#include "WProgram.h"

#include "unity.h"

#include "test_VCO_driver.hpp"



int main(void){
    // Serial1.begin(115200);

    UNITY_BEGIN();
    // std::string blah = "";

    run_VCO_tests();

    return UNITY_END();



}
