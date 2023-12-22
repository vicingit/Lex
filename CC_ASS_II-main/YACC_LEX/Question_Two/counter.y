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

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    printf("Number of 'a's: %d\n", yylval);
    return 0;
}
