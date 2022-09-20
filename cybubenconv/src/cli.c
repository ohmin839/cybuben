#include "parser.c"

int main()
{
    yycontext ctx;
    memset(&ctx, 0, sizeof(yycontext)); 
    while (yyparse(&ctx));
    yyrelease(&ctx);
    return 0;
}

