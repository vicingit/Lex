%{
#include <stdio.h>
%}

%%

is|am|are|were|was|be|being|been|do|does|did|will|would|should|can|could|has|have|had|go   {
    printf("Verb: %s\n", yytext);
}

.   {
    /* Ignore any characters other than spaces or tabs */
}

\n  {
    /* Newline character, no action needed */
}

%%

int main() {
    yylex();
    return 0;
}
