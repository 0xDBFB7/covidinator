#include "mocks.hpp"

#include "test_VCO_driver.hpp"
#include "VCO_driver.hpp"
#include <iostream>


int main(void)
{
	std::cout << "\033[1;36m ========= mocked test started =========\033[0m\n";
	run_VCO_tests();
}
