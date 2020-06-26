
//thanks https://stackoverflow.com/questions/2744181/how-to-call-c-function-from-c!

#include "unity_connector.h"

#ifdef __cplusplus
#include "WProgram.h"

extern "C" {
#endif

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
