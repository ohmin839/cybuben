#include <stdio.h>
#include <string.h>
#include "converter.leg.c"

int main()
{
    yycontext yy;
    memset(&yy, 0, sizeof(yycontext)); 

    yy.stream = stdin;
    while (yyparse(&yy));

    cybuben_string* result = yy.result;
    if (result != NULL) {
        char* chars = cybuben_string_to_chars(result);
        printf("%s", chars);
        free(chars);
    }

    cybuben_string_free(yy.result);
    yyrelease(&yy);

    return 0;
}

