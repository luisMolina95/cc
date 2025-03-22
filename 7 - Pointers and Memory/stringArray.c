#include <stdio.h>
#include <stdlib.h>

char characterAt(char *s, unsigned int position)
{
    return s[position];
}

unsigned int length(char *s)
{
    unsigned int length = 0;
    while (s[length] != 0)
    {

        length++;
    }
    return length;
}

void append(char **s, char c)
{
    unsigned int oldLength = length(*s);
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

void concatenate(char **s1, char **s2)
{
    unsigned int s1OldLength = length(*s1);
    unsigned int s2Length = length(*s2);
    unsigned int newLength = s1OldLength + s2Length;

    char *newS = malloc((newLength + 1) * sizeof(char));
    for (unsigned int i = 0; i < s1OldLength; i++)
    {
        newS[i] = (*s1)[i];
    }
    for (unsigned int i = 0; i < s2Length; i++)
    {
        newS[s1OldLength + i] = (*s2)[i];
    }
    newS[newLength] = 0;

    free(*s1);
    *s1 = newS;
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

    char *b = malloc(4 * sizeof(char));
    b[0] = 'b';
    b[1] = 'e';
    b[2] = 'd';
    b[3] = 0;

    printf("a: %s\n", a);

    concatenate(&a, &b);
    printf("a: %s\n", a);

    printf("End\n");

    free(a);
    free(b);
    return 0;
}
