#include <stdbool.h>

#ifndef CYBUBEN_MAPPING_H
#define CYBUBEN_MAPPING_H

typedef struct _pc {
    char* v;
    struct _pc* n;
} parsed_chunk_t;

parsed_chunk_t* create_chunk(char* str);
void print_chunk(parsed_chunk_t* pc);
void free_chunk(parsed_chunk_t* pc);

bool includes_char(char* token, char target);

#endif
