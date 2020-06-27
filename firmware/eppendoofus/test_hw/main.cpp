#include "WProgram.h"

// OpenHTF could be a viable alternative to this.
#include "unity.h"

#include "test_VCO_driver.hpp"

#include "test_PID.hpp"
#include "test_main.hpp"


void setUp(){ //unused due to different dir structure.
}
void tearDown(){
}


int main(void){

    UNITY_BEGIN();

    run_VCO_tests();

    run_PID_tests();
    // run_main_tests();

    return UNITY_END();
        
}
