#include "helpers.hpp"

std::string WString_to_std_string(String input){
    std::string output = input.c_str();
    return output;
}


// template <class T>
float constrain(float x, float a, float b) {
    if(x < a) {
        return a;
    }
    else if(b < x) {
        return b;
    }
    else
        return x;
}
// template float constrain(float x, float a, float b) {
