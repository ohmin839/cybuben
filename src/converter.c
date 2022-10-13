#include <stdio.h>
#include <string.h>
#include "converter.leg.c"

char* cybuben_to_aybuben(char* ascii) {
    yycontext yy;
    memset(&yy, 0, sizeof(yycontext)); 

    int len = strlen(ascii);
    yy.stream = fmemopen(ascii, len, "r");

    while(yyparse(&yy));
    fclose(yy.stream);

    char* chars = cybuben_string_to_chars(yy.result);
    yyrelease(&yy);

    return chars;
}
