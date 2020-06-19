
#include "WProgram.h"

#include "test_VCO_driver.hpp"


int main(void){

    Serial.begin(115200);

    run_VCO_tests();

    // run_all();



}
