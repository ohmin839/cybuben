#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "mapping.h"

parsed_chunk_t* create_chunk(char* str) {
    parsed_chunk_t* pc = malloc(sizeof(parsed_chunk_t));

    size_t len = strlen(str);
    pc->v = malloc(sizeof(char) * (len+1));
    strcpy(pc->v, str);

    pc->n = NULL;

    return pc;
}

void print_chunk(parsed_chunk_t* pc) {
    while(pc != NULL) {
        printf("%s", pc->v);
        pc = pc->n;
    }
}

void free_chunk(parsed_chunk_t* pc) {
    parsed_chunk_t* npc;
    while(pc != NULL) {
        npc = pc->n;
        free(pc->v);
        free(pc);
        pc = npc;
    }
}

bool includes_char(char* token, char target) {
    size_t l = strlen(token);
    for (int i = 0; i < l; i++) {
        if (token[i] == target) {
            return true;
        }
    }
    return false;
}
