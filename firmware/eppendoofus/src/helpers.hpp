#ifdef MOCK_INCLUDES

#define print(n) std::cout << n << "\n"

#else

#define print(n) Serial1.println(n)

#endif

// void compute_max_PWM_freq(){
//     return (CORE_CLOCK_FREQ / analog_write_res)/2
// }
