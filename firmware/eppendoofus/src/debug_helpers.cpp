#include "debug_helpers.hpp"


void debug_preamble_printer(std::string function, int line, std::string file, std::string name){
    std::string preamble;
    preamble = preamble + "\n\033[1;36m";
    preamble = preamble + "\033[1;36m" + "\033[0m | \033[1;36m" + "line " +
                "\033[0m | \033[1;36m" + function + "\033[0m | \033[1;33m" + name + "\033[0m";
    debug_serial.println(String(preamble.c_str()));
}

// template<typename T>
// void array_stats(T * input, int start, int end, std::string name, std::string name, std::string name){
//
// }
//
// template<typename T>
// void pretty_print_array(T input, int start, int end){
//   print("\033[1;33m" << "[" << end << "]" << "\033[0m = {");
//
//   for(int i = start; i < end-1; i++){
//     std::cout << input[i] << ",";
//   }
//   if(end-start > 0){
//     std::cout << input[end-1]; //handle trailing ,
//   }
//
//   std::cout << "};\n";
// }
// template void pretty_print_array(float * input, int start, int length);
// template void pretty_print_array(int * input, int start, int length);


//Serial.println(founded_dev.getName().c_str());
