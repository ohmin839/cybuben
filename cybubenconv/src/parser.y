%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mapping.h"

int yylex(void);
int yyerror(char* s);
%}

%union {
    parsed_chunk_t* pc;
}

%token <pc> LARGE_A
%token <pc> LARGE_B
%token <pc> LARGE_C
%token <pc> LARGE_D
%token <pc> LARGE_E
%token <pc> LARGE_F
%token <pc> LARGE_G
%token <pc> LARGE_H
%token <pc> LARGE_I
%token <pc> LARGE_J
%token <pc> LARGE_K
%token <pc> LARGE_L
%token <pc> LARGE_M
%token <pc> LARGE_N
%token <pc> LARGE_O
%token <pc> LARGE_P
%token <pc> LARGE_Q
%token <pc> LARGE_R
%token <pc> LARGE_S
%token <pc> LARGE_T
%token <pc> LARGE_U
%token <pc> LARGE_V
%token <pc> LARGE_W
%token <pc> LARGE_X
%token <pc> LARGE_Y
%token <pc> LARGE_Z

%token <pc> SMALL_A
%token <pc> SMALL_B
%token <pc> SMALL_C
%token <pc> SMALL_D
%token <pc> SMALL_E
%token <pc> SMALL_F
%token <pc> SMALL_G
%token <pc> SMALL_H
%token <pc> SMALL_I
%token <pc> SMALL_J
%token <pc> SMALL_K
%token <pc> SMALL_L
%token <pc> SMALL_M
%token <pc> SMALL_N
%token <pc> SMALL_O
%token <pc> SMALL_P
%token <pc> SMALL_Q
%token <pc> SMALL_R
%token <pc> SMALL_S
%token <pc> SMALL_T
%token <pc> SMALL_U
%token <pc> SMALL_V
%token <pc> SMALL_W
%token <pc> SMALL_X
%token <pc> SMALL_Y
%token <pc> SMALL_Z

%token <pc> DIGITS
%token <pc> DOLLAR

%token <pc> COMMA
%token <pc> PERIOD
%token <pc> BACKQUOTE
%token <pc> CORON
%token <pc> HYPHEN
%token <pc> LPARENTHESIS
%token <pc> RPARENTHESIS
%token <pc> LGUILLEMET
%token <pc> RGUILLEMET
%token <pc> QUESTION
%token <pc> EXCLAMATION

%token <pc> SPACE
%token <pc> NEWLINE

%token <pc> ANYCHAR

%type <pc> letters
%type <pc> letter

%%

text:
    | lines 
    ;

lines:
    lines line
    | line
    ;

line:
    letters NEWLINE
    {
        print_chunk($1);
        print_chunk($2);
        free_chunk($1);
        free_chunk($2);
    }
    | NEWLINE
    {
        print_chunk($1);
        free_chunk($1);
    }
    ;

letters:
    letter letters
    {
        $1->n = $2;
        $$ = $1;
    }
    | letter
    ;

letter:
      LARGE_A
    | LARGE_B
    | LARGE_C
    | LARGE_D
    | LARGE_E
    | LARGE_F
    | LARGE_G
    | LARGE_H
    | LARGE_I
    | LARGE_J
    | LARGE_K
    | LARGE_L
    | LARGE_M
    | LARGE_N
    | LARGE_O
    | LARGE_P
    | LARGE_Q
    | LARGE_R
    | LARGE_S
    | LARGE_T
    | LARGE_U
    | LARGE_V
    | LARGE_W
    | LARGE_X
    | LARGE_Y
    | LARGE_Z
    | SMALL_A
    | SMALL_B
    | SMALL_C
    | SMALL_D
    | SMALL_E
    | SMALL_F
    | SMALL_G
    | SMALL_H
    | SMALL_I
    | SMALL_J
    | SMALL_K
    | SMALL_L
    | SMALL_M
    | SMALL_N
    | SMALL_O
    | SMALL_P
    | SMALL_Q
    | SMALL_R
    | SMALL_S
    | SMALL_T
    | SMALL_U
    | SMALL_V
    | SMALL_W
    | SMALL_X
    | SMALL_Y
    | SMALL_Z
    | DIGITS
    | DOLLAR
    | COMMA
    | PERIOD
    | BACKQUOTE
    | CORON
    | HYPHEN
    | LPARENTHESIS
    | RPARENTHESIS
    | LGUILLEMET
    | RGUILLEMET
    | QUESTION
    | EXCLAMATION
    | SPACE
    | ANYCHAR
    ;

%%

extern FILE* yyin;

int main(void)
{
    do {
        yyparse();
    } while(!feof(yyin));
    return 0;
}

int yyerror(char* s)
{
    fprintf(stderr, "%s\n", s);
    return 0;
}
