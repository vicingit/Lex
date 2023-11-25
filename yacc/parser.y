%{
#include <stdio.h>
%}

%token A B

%%
start: expr
      { printf("Valid string: %s\n", $1); }
      | error
      { printf("Invalid string\n"); }

expr: /* empty */
     | expr A B
       { $$ = $1; printf("a"); }
     | A B
       { $$ = $1; printf("a"); }

%%

int main() {
    yyparse();
    return 0;
}

int yyerror(const char *s) {
    printf("Error: %s\n", s);
    return 0;
}
