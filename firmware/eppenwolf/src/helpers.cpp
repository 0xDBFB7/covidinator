#include "helpers.hpp"

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



float voltage_divider(float vout, float Rtop, float Rbottom){
    return (vout/(Rbottom/(Rtop+Rbottom)));
}
// template float constrain(float x, float a, float b) {
