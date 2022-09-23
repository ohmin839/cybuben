#ifndef CYBUBEN_UTIL_H
#define CYBUBEN_UTIL_H

#include <stdbool.h>

// node START
typedef struct _cybuben_node {
    char* value;
    struct _cybuben_node* next;
} cybuben_node;

cybuben_node* cybuben_node_create(char*);
void cybuben_node_free(cybuben_node*);
// node END

// string START
typedef struct _cybuben_string {
    cybuben_node* head;
    int length;
} cybuben_string;

cybuben_string* cybuben_string_create(cybuben_node*);
char* cybuben_string_to_chars(cybuben_string*);
void cybuben_string_free(cybuben_string*);
// string END

// etc START
bool cybuben_includes_char(char* token, char target);
// etc END

#endif

