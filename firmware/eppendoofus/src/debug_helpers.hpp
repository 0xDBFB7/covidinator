#include <iostream>
#include <fstream>

#include <string>

#define DEBUG_PRINT

#define __FILENAME__ (strrchr(__FILE__, '/') ? strrchr(__FILE__, '/') + 1 : __FILE__)
//make filename__ preprocessor directive relative - thanks red1ynx!


template<typename T>
void pretty_print_array(T * input, int start, int end);


void debug_preamble_printer(std::string function, int line, std::string file, std::string name);


#define debug_array(input, start, end) debug_preamble_printer(__FUNCTION__, __LINE__, __FILENAME__, #input); pretty_print_array(input, start, end);
#define debug_val(input) debug_preamble_printer(__FUNCTION__, __LINE__, __FILENAME__, #input); print(" = " + input);

#endif
