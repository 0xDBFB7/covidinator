
#include <mgl2/mgl.h>

#include "gtest/gtest.h"



//rm -r * && cmake ../
//make -j16 && ./test/nyion_test

//this file calls the modules' respective test functions.

//Test names cannot contain _
//big deal

TEST(MathGL, MathGL_Basic)
{
    mglGraph gr;
    gr.FPlot("sin(pi*x)"); //recall: array linking:
    // double *a = new double[50];
    // for(int i=0;i<50;i++)   a[i] = sin(M_PI*i/49.);
    // mglData y;
    // y.Link(a,50);
  // gr.WriteFrame("test.png");

}

int main(int argc, char** argv)
{
    ::testing::InitGoogleTest(&argc, argv);

    int retval = RUN_ALL_TESTS();
    return retval;
}
