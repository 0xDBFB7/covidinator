

#include <mgl2/mgl.h>

#include "gtest/gtest.h"

#include "sim_test.hpp"

int main(int argc, char** argv)
{
    ::testing::InitGoogleTest(&argc, argv);

    int retval = RUN_ALL_TESTS();
    return retval;
}
