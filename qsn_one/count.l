%{
#include "y.tab.h"
%}

%%
a   { yylval.count++; return 'a'; }
b   { return 'b'; }
\n  { return 0; } // Ignore newlines
.   { return yytext[0]; }
%%

int yywrap() {
    return 1;
}
