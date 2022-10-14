#include <stdio.h>
#include <stdlib.h>
#include "collector_api.c"
#include "util.h"

int main(void) {
    cybuben_node* words = cybuben_to_hayeren_words("Բարև Ձեզ։");

    for(cybuben_node* node = words; node != NULL; node = node->next) {
        printf("%s\n", node->value);    
    }

    cybuben_node_free(words);
    return 0;
}
