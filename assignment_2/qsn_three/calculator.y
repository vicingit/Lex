%{
    #include<stdio.h>
    int yylex(void);
    int yyerror(char *);
%}

%token  NUMBER 
%left SUM SUB

%%
S: E {printf("result = %d\n", $1);};
E: T {$$ = $1;} | E SUM T {$$ = $1 + $3;} | E SUB T {$$ = $1 - $3;};
T: F {$$ = $1;} | '(' E ')' {$$ = $2;};
F: NUMBER {$$ = $1;};
%%



int main(){
yyparse();
return 0;
}

int yyerror(char *s){
    printf("%s",s);
}
