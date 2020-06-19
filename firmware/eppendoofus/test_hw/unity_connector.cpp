
#include "unity_connector.h"

#ifdef __cplusplus
#include "WProgram.h"

extern "C" {
#endif

// Inside this "extern C" block, I can implement functions in C++, which will externally
//   appear as C functions (which means that the function IDs will be their names, unlike
//   the regular C++ behavior, which allows defining multiple functions with the same name
//   (overloading) and hence uses function signature hashing to enforce unique IDs),




void CONNECTED_WRITE(char a) {
    Serial1.write(a);
}

void CONNECTED_BEGIN(){
    Serial1.begin(115200);
}

void CONNECTED_FLUSH() {
    Serial1.flush();
}

void CONNECTED_CLOSE() {
}

#ifdef __cplusplus
}
#endif
