#include <stdio.h>
#include <string.h>

#include "util.h"
#include "collector.leg.c"

cybuben_node* cybuben_to_hayeren_words(char* ascii) {
    yycontext yy;
    memset(&yy, 0, sizeof(yycontext)); 

    int len = strlen(ascii);
    yy.stream = fmemopen(ascii, len, "r");

    while(yyparse(&yy));
    fclose(yy.stream);

    cybuben_node* words = cybuben_node_copy(yy.result);

    cybuben_node_free(yy.result);
    yyrelease(&yy);

    return words;
}
