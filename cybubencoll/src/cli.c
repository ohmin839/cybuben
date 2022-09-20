#include "parser.c"

int main()
{
    yycontext ctx;
    memset(&ctx, 0, sizeof(yycontext)); 
    while (yyparse(&ctx));
    print_word_node(head);
    free_word_node(head);
    yyrelease(&ctx);

    return 0;
}


