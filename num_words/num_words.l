%{
#include <stdio.h>
int wordCount = 0;
int totalSize = 0;
%}

%%
[a-zA-Z]+ {
    wordCount++;
    totalSize += yyleng;
}
.|\n    ; /* Ignore all other characters eg punctuations */

%%

int main() {
    yylex();
    printf("Total words: %d\n", wordCount);
    printf("Total size of words: %d characters\n", totalSize);
    return 0;
}
