#include <stdio.h>
#include <stdlib.h>

char *substring(char *s, unsigned int p, unsigned int l)
{
    char *ss = malloc((l + 1) * sizeof(char));
    unsigned int ssIndex = 0;
    for (unsigned int i = p; i < (p + l); i++)
    {
        ss[ssIndex] = s[i];
        ssIndex++;
    }
    ss[ssIndex] = 0;
    return ss;
}

int main()
{
    char *name = "luisMolina";
    char *ss = substring(name, 4, 3);
    printf("Result: %s\n", ss);
    free(ss);
    return 0;
}
