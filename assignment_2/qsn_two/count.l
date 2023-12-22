%{
    #include "y.tab.h"
    int yylex(void);
    int yyerror(char *);
    int yywrap(void);
%}

%%

a    { yylval +=1 ; return A; }
b    { return B; }
\n   { return EOL; }
.    { /* ignore other characters */ }

%%

int yywrap(void) {
    return 1;  // indicates the end of input
}

