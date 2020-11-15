// #include <TMCStepper.h>
// #include "turbidimeter.hpp"
// #include "FreqMeasure.h"
//
#include "WProgram.h"

void init_stepper();
void move_relative(bool direction, float distance);
// void home();
// void move_to_cuvette(int index, int function);
void move_absolute(float new_position);
