#ifndef CYBUBENCOLL_ACTION_H
#define CYBUBENCOLL_ACTION_H

typedef struct _wn {
    char* v;
    struct _wn* n;
} word_node_t;

word_node_t* create_word_node(char* token);
void add_word_node(word_node_t* head, char* token);
void print_word_node(word_node_t* head);
void free_word_node(word_node_t* head);

#endif
