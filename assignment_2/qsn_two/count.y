%{
#include <stdio.h>
int yylex();
void yyerror(const char *s);

int count = 0;
int yylval;
%}

%token A B EOL

%%

S: A S | B ;

%%

int main() {
    yyparse();
    printf("Number of 'a's: %d\n", yylval);
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}


