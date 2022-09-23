#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "util.h"

// node START
cybuben_node* cybuben_node_create(char* str) {
    cybuben_node* node = malloc(sizeof(cybuben_node));

    int len = strlen(str);
    node->value = malloc(sizeof(char) * (len+1));
    strcpy(node->value, str);
    node->next = NULL;

    return node;
}

void cybuben_node_free(cybuben_node* node) {
    cybuben_node* next_node;
    while(node != NULL) {
        next_node = node->next;
        free(node->value);
        free(node);
        node = next_node;
    }
}
// node END

// string START
cybuben_string* cybuben_string_create(cybuben_node* node) {
    cybuben_string* string = malloc(sizeof(cybuben_string));

    string->head = node;
    string->length = 0;
    for (cybuben_node* i = string->head; i != NULL; i = i->next) {
        int len = strlen(i->value);
        string->length += len;
    }

    return string;
}

char* cybuben_string_to_chars(cybuben_string* string) {
    int len = string->length;
    char* raw = malloc(sizeof(char) * (len+1));

    memset(raw, 0, len);
    for (cybuben_node* i = string->head; i != NULL; i = i->next) {
        strcat(raw, i->value);
    }

    return raw;
}

void cybuben_string_free(cybuben_string* string) {
    cybuben_node_free(string->head);
    free(string);
}
// string END


// etc START
bool cybuben_includes_char(char* token, char target) {
    int l = strlen(token);
    for (int i = 0; i < l; i++) {
        if (token[i] == target) {
            return true;
        }
    }
    return false;
}
// etc END

