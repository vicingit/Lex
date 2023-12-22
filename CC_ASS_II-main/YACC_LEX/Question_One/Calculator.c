#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#define SUCCESS 0
#define FAILURE 1

char lookahead;

int expr();

int term();

int factor();

void match(char expected)
{
    if (lookahead == expected)
    {
        lookahead = getchar();
    }
    else
    {
        fprintf(stderr, "Error: Expected '%c', found '%c'\n", expected, lookahead);
        exit(FAILURE);
    }
}

// Recursive Descent Parsing functions : this function parses the first and the second terms in the expression.
int expr()
{
    int result = term();

    while (lookahead == '+')
    {
        match('+');
        result += term();
    }

    return result;
}

// parses the first and the second factor and multiplies  their results.
int term()
{
    int result = factor();

    while (lookahead == '*')
    {
        match('*');
        result *= factor();
    }

    return result;
}

int factor()
{
    int result;

    if (lookahead == '(')
    {
        match('(');
        result = expr(); // Parse the expression inside parentheses
        match(')');
    }
    else if (isdigit(lookahead))
    {
        ungetc(lookahead, stdin);
        scanf("%d", &result);
        lookahead = getchar();
    }
    else
    {
        fprintf(stderr, "Error: Unexpected symbol '%c'\n", lookahead);
        exit(FAILURE);
    }

    return result;
}

int main()
{
    printf("Enter an Arithmetic Expression with + and/or * (brackets supported): ");

    lookahead = getchar();

    int result = expr();

    // Check if the entire input is consumed
    if (lookahead != '\n' && lookahead != EOF)
    {
        fprintf(stderr, "Error: Unexpected input after expression\n");
        return FAILURE;
    }

    printf("Result: %d\n", result);

    return SUCCESS;
}
