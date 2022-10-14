#include <stdio.h>
#include <string.h>

#include "util.h"
#include "converter.leg.c"

char* cybuben_to_aybuben(char* ascii) {
    yycontext yy;
    memset(&yy, 0, sizeof(yycontext)); 

    int len = strlen(ascii);
    yy.stream = fmemopen(ascii, len, "r");

    while(yyparse(&yy));
    fclose(yy.stream);

    char* chars = cybuben_string_to_chars(yy.result);

    cybuben_string_free(yy.result);
    yyrelease(&yy);

    return chars;
}
