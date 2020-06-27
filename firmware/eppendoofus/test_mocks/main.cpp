
#include "unity.h"

#include "mocks.hpp"


#include "test_VCO_driver.hpp"
#include "test_PID.hpp"

// #include "VCO_driver.hpp"
#include <iostream>

void setUp(){
	reset_mocks();
}
void tearDown(){
	reset_mocks();
}


int main(void)
{

	UNITY_BEGIN();

	run_VCO_tests();
	run_PID_tests();

	return UNITY_END();

}
