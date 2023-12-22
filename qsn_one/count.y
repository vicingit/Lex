%{
#include <stdio.h>

int count = 0; // to store the count of 'a's
%}

%union {
    int count;
}

%token <count> A B

%%

S : A S     { $$ = $1 + $2; }
  | B       { $$ = $1; }
  ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    printf("Number of 'a's in the input: %d\n", count);
    return 0;
}
