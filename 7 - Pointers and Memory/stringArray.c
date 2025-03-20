#include <stdio.h>
#include <stdlib.h>

char characterAt(const char *s, const unsigned int position)
{
    return s[position];
}

void append(char **s, char c)
{
    unsigned int oldLength = 0;
    while ((*s)[oldLength] != 0)
    {

        oldLength++;
    }
    char *newS = malloc((oldLength + 2) * sizeof(char));
    for (unsigned int i = 0; i < oldLength; i++)
    {
        newS[i] = (*s)[i];
    }
    newS[oldLength] = c;
    newS[oldLength + 1] = 0;
    free(*s);
    *s = newS;
}

int main()
{
    printf("Start\n");
    char *a = malloc(5 * sizeof(char));
    a[0] = 't';
    a[1] = 'e';
    a[2] = 's';
    a[3] = 't';
    a[4] = 0;

    printf("a: %s\n", a);
    append(&a, '!');
    printf("a: %s\n", a);
    printf("End\n");
    free(a);
    return 0;
}
