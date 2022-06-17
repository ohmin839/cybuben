%{
#include "mapping.h"
#include "parser.h"
%}

%%

A {
    yylval.pc = create_chunk("\u0531");
    return LARGE_A;
}
B {
    yylval.pc = create_chunk("\u0532");
    return LARGE_B;
}
C[h']? {
    if (includes_char(yytext, 'h')) {
        yylval.pc = create_chunk("\u0549");
    } else if (includes_char(yytext, '\'')) {
        yylval.pc = create_chunk("\u053E");
    } else {
        yylval.pc = create_chunk("\u0551");
    }
    return LARGE_C;
}
Dz? {
    if (includes_char(yytext, 'z')) {
        yylval.pc = create_chunk("\u0541");
    } else {
        yylval.pc = create_chunk("\u0534");
    }
    return LARGE_D;
}
E'? {
    if (includes_char(yytext, '\'')) {
        yylval.pc = create_chunk("\u0537");
    } else {
        yylval.pc = create_chunk("\u0535");
    }
    return LARGE_E;
}
F {
    yylval.pc = create_chunk("\u0556");
    return LARGE_F;
}
Gh? {
    if (includes_char(yytext, 'h')) {
        yylval.pc = create_chunk("\u0542");
    } else {
        yylval.pc = create_chunk("\u0533");
    }
    return LARGE_G;
}
H {
    yylval.pc = create_chunk("\u0540");
    return LARGE_H;
}
I {
    yylval.pc = create_chunk("\u053B");
    return LARGE_I;
}
J {
    yylval.pc = create_chunk("\u054B");
    return LARGE_J;
}
K {
    yylval.pc = create_chunk("\u053F");
    return LARGE_K;
}
L {
    yylval.pc = create_chunk("\u053C");
    return LARGE_L;
}
M {
    yylval.pc = create_chunk("\u0544");
    return LARGE_M;
}
N {
    yylval.pc = create_chunk("\u0546");
    return LARGE_N;
}
O {
    yylval.pc = create_chunk("\u0555");
    return LARGE_O;
}
P'? {
    if (includes_char(yytext, '\'')) {
        yylval.pc = create_chunk("\u0553");
    } else {
        yylval.pc = create_chunk("\u054A");
    }
    return LARGE_P;
}
Q {
    yylval.pc = create_chunk("\u0554");
    return LARGE_Q;
}
Rr? {
    if (includes_char(yytext, 'r')) {
        yylval.pc = create_chunk("\u054C");
    } else {
        yylval.pc = create_chunk("\u0550");
    }
    return LARGE_R;
}
Sh? {
    if (includes_char(yytext, 'h')) {
        yylval.pc = create_chunk("\u0547");
    } else {
        yylval.pc = create_chunk("\u054D");
    }
    return LARGE_S;
}
T[w']? {
    if (includes_char(yytext, 'w')) {
        yylval.pc = create_chunk("\u0543");
    } else if (includes_char(yytext, '\'')) {
        yylval.pc = create_chunk("\u0539");
    } else {
        yylval.pc = create_chunk("\u054F");
    }
    return LARGE_T;
}
U {
    yylval.pc = create_chunk("\u0548\u0582");
    return LARGE_U;
}
Vo? {
    if (includes_char(yytext, 'o')) {
        yylval.pc = create_chunk("\u0548");
    } else {
        yylval.pc = create_chunk("\u054E");
    }
    return LARGE_V;
}
W {
    yylval.pc = create_chunk("\u0552");
    return LARGE_W;
}
X {
    yylval.pc = create_chunk("\u053D");
    return LARGE_X;
}
Y'? {
    if (includes_char(yytext, '\'')) {
        yylval.pc = create_chunk("\u0538");
    } else {
        yylval.pc = create_chunk("\u0545");
    }
    return LARGE_Y;
}
Zh? {
    if (includes_char(yytext, 'h')) {
        yylval.pc = create_chunk("\u053A");
    } else {
        yylval.pc = create_chunk("\u0536");
    }
    return LARGE_Z;
}

a {
    yylval.pc = create_chunk("\u0561");
    return SMALL_A;
}
b {
    yylval.pc = create_chunk("\u0562");
    return SMALL_B;
}
c[h']? {
    if (includes_char(yytext, 'h')) {
        yylval.pc = create_chunk("\u0579");
    } else if (includes_char(yytext, '\'')) {
        yylval.pc = create_chunk("\u056E");
    } else {
        yylval.pc = create_chunk("\u0581");
    }
    return SMALL_C;
}
dz? {
    if (includes_char(yytext, 'z')) {
        yylval.pc = create_chunk("\u0571");
    } else {
        yylval.pc = create_chunk("\u0564");
    }
    return SMALL_D;
}
e[v']? {
    if (includes_char(yytext, 'v')) {
        yylval.pc = create_chunk("\u0587");
    } else if (includes_char(yytext, '\'')) {
        yylval.pc = create_chunk("\u0567");
    } else {
        yylval.pc = create_chunk("\u0565");
    }
    return SMALL_E;
}
f {
    yylval.pc = create_chunk("\u0586");
    return SMALL_F;
}
gh? {
    if (includes_char(yytext, 'v')) {
        yylval.pc = create_chunk("\u0572");
    } else {
        yylval.pc = create_chunk("\u0563");
    }
    return SMALL_G;
}
h {
    yylval.pc = create_chunk("\u0570");
    return SMALL_H;
}
i {
    yylval.pc = create_chunk("\u056B");
    return SMALL_I;
}
j {
    yylval.pc = create_chunk("\u057B");
    return SMALL_J;
}
k {
    yylval.pc = create_chunk("\u056F");
    return SMALL_K;
}
l {
    yylval.pc = create_chunk("\u056C");
    return SMALL_L;
}
m {
    yylval.pc = create_chunk("\u0574");
    return SMALL_M;
}
n {
    yylval.pc = create_chunk("\u0576");
    return SMALL_N;
}
o {
    yylval.pc = create_chunk("\u0585");
    return SMALL_O;
}
p'? {
    if (includes_char(yytext, '\'')) {
        yylval.pc = create_chunk("\u0583");
    } else {
        yylval.pc = create_chunk("\u057A");
    }
    return SMALL_P;
}
q {
    yylval.pc = create_chunk("\u0584");
    return SMALL_Q;
}
rr? {
    if (strcmp(yytext, "rr") == 0) {
        yylval.pc = create_chunk("\u057C");
    } else {
        yylval.pc = create_chunk("\u0580");
    }
    return SMALL_R;
}
sh? {
    if (includes_char(yytext, 'h')) {
        yylval.pc = create_chunk("\u0577");
    } else {
        yylval.pc = create_chunk("\u057D");
    }
    return SMALL_S;
}
t[w']? {
    if (includes_char(yytext, 'w')) {
        yylval.pc = create_chunk("\u0573");
    } else if (includes_char(yytext, '\'')) {
        yylval.pc = create_chunk("\u0569");
    } else {
        yylval.pc = create_chunk("\u057F");
    }
    return SMALL_T;
}
u {
    yylval.pc = create_chunk("\u0578\u0582");
    return SMALL_U;
}
vo? {
    if (includes_char(yytext, 'o')) {
        yylval.pc = create_chunk("\u0578");
    } else {
        yylval.pc = create_chunk("\u057E");
    }
    return SMALL_V;
}
w {
    yylval.pc = create_chunk("\u0582");
    return SMALL_W;
}
x {
    yylval.pc = create_chunk("\u056D");
    return SMALL_X;
}
y'? {
    if (includes_char(yytext, '\'')) {
        yylval.pc = create_chunk("\u0568");
    } else {
        yylval.pc = create_chunk("\u0575");
    }
    return SMALL_Y;
}
zh? {
    if (includes_char(yytext, 'h')) {
        yylval.pc = create_chunk("\u056A");
    } else {
        yylval.pc = create_chunk("\u0566");
    }
    return SMALL_Z;
}

[0-9]+ {
    yylval.pc = create_chunk(yytext);
    return DIGITS;
}
\$ {
    yylval.pc = create_chunk("\u058F");
    return DOLLAR;
}

, {
    yylval.pc = create_chunk(yytext);
    return COMMA;
}
\. {
    yylval.pc = create_chunk(yytext);
    return PERIOD;
}
` {
    yylval.pc = create_chunk("\u055D");
    return BACKQUOTE;
}
: {
    yylval.pc = create_chunk("\u0589");
    return CORON;
}
- {
    yylval.pc = create_chunk(yytext);
    return HYPHEN;
}
\( {
    yylval.pc = create_chunk(yytext);
    return LPARENTHESIS;
}
\) {
    yylval.pc = create_chunk(yytext);
    return RPARENTHESIS;
}
\<< {
    yylval.pc = create_chunk("\u00AB");
    return LGUILLEMET;
}
>> {
    yylval.pc = create_chunk("\u00BB");
    return RGUILLEMET;
}
\? {
    yylval.pc = create_chunk("\u055E");
    return QUESTION;
}
!~? {
    if (includes_char(yytext, '~')) {
        yylval.pc = create_chunk("\u055C");
    } else {
        yylval.pc = create_chunk("\u055B");
    }
    return EXCLAMATION;
}

[ \t] {
    yylval.pc = create_chunk(yytext);
    return SPACE;
}

\r?\n {
    yylval.pc = create_chunk(yytext);
    return NEWLINE;
}

. {
    yylval.pc = create_chunk(yytext);
    return ANYCHAR;
}

%%
