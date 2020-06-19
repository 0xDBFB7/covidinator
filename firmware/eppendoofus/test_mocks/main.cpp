#define UNITY_OUTPUT_CHAR(a)    Serial1.write(a)
#define UNITY_OUTPUT_START()    Serial1.begin(115200)
#define UNITY_OUTPUT_FLUSH()    Serial1.flush()
#define UNITY_OUTPUT_COMPLETE() Serial1.close()
#define UNITY_OUTPUT_COLOR

#include "unity.h"

// #include "mocks.hpp"

// #include "test_VCO_driver.hpp"
// #include "VCO_driver.hpp"
#include <iostream>




int main(void)
{

	UNITY_BEGIN();

	// run_VCO_tests();

	return UNITY_END();

}
