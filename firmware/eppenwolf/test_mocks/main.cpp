
#include "unity.h"

#include "mocks.hpp"


#include "test_VCO_driver.hpp"
#include "test_PID.hpp"
#include "test_host_comms.hpp"

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
	run_host_comms_tests();

	return UNITY_END();

}
