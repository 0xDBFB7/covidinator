
#include "unity.h"

#include "mocks.hpp"


#include "test_VCO_driver.hpp"
// #include "VCO_driver.hpp"
#include <iostream>

void setUp(){ //unused due to different dir structure.
}
void tearDown(){
}


int main(void)
{

	UNITY_BEGIN();

	run_VCO_tests();

	return UNITY_END();

}
