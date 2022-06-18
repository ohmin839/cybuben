#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "action.h"

void add_word_node(word_node_t* head, char* token) {
    word_node_t* p = head;
    while(p != NULL) {
        if (strcmp(p->v, token) == 0) {
            return;
        }
        if (p->n == NULL) {
            word_node_t* np = create_word_node(token);
            p->n = np;
            return;
        }
        p = p->n;
    }
}

word_node_t* create_word_node(char* token) {
    word_node_t* p = malloc(sizeof(word_node_t));

    size_t len = strlen(token);
    p->v = malloc(sizeof(char) *(len+1));
    strcpy(p->v, token);

    p->n = NULL;
    
    return p;
}

void print_word_node(word_node_t* head) {
    word_node_t* p = head;
    while(p != NULL) {
        printf("%s\n", p->v);
        p = p->n;
    }
}

void free_word_node(word_node_t* head) {
    word_node_t* p = head;
    word_node_t* np;
    while(p != NULL) {
        np = p->n;
        free(p->v);
        free(p);
        p = np;
    }
}
