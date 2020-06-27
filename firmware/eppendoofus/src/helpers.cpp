#include "helpers.hpp"

std::string WString_to_std_string(String input){
    std::string output = input.c_str();
    return output;
}


template<class T>
const T& constrain(const T& x, const T& a, const T& b) {
    if(x < a) {
        return a;
    }
    else if(b < x) {
        return b;
    }
    else
        return x;
}
