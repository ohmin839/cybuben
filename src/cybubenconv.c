#include "converter.c"

int main()
{
    yycontext yy;
    memset(&yy, 0, sizeof(yycontext)); 
    while (yyparse(&yy));

    cybuben_string* result = yy.result;
    if (result != NULL) {
        char* chars = cybuben_string_to_chars(result);
        printf("%s", chars);
        free(chars);
        free(yy.result);
    }

    yyrelease(&yy);
    return 0;
}

