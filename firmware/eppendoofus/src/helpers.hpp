#ifdef MOCK_INCLUDES

#define print(n) std::cout << n << "\n"

#else

#define print(n) Serial1.println(n)

#endif


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


// void compute_max_PWM_freq(){
//     return (CORE_CLOCK_FREQ / analog_write_res)/2
// }
