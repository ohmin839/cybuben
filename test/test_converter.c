#include <stdio.h>
#include <stdlib.h>
#include "converter_api.c"

int main(void) {
    char* result = cybuben_to_aybuben("Barev Dzez:");
    printf("%s\n", result);    
    free(result);
    return 0;
}
