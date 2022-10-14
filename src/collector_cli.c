#include <stdio.h>
#include <string.h>
#include "collector.leg.c"

int main()
{
    yycontext yy;
    memset(&yy, 0, sizeof(yycontext)); 

    yy.stream = stdin;
    while (yyparse(&yy));

    cybuben_node* word_set = cybuben_set_create(yy.result);
    cybuben_node_free(yy.result);

    for (cybuben_node* node = word_set; node != NULL; node = node->next) {
        printf("%s\n", node->value);
    }

    cybuben_node_free(word_set);
    yyrelease(&yy);

    return 0;
}


