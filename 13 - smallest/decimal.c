#include <stddef.h>
#include <stdio.h>

int main()
{

    double carry = 0.69;
    double carry2;
    for (size_t i = 0; i < 22; i++)
    {
        carry2 = carry * 2;
        if (carry2 >= 1.0)
        {
            printf("%0.2f * 2 = %0.2f -> 1\n", carry, carry2);
            carry = carry2 - 1.0;
        }
        else
        {
            printf("%0.2f * 2 = %0.2f -> 0\n", carry, carry2);
            carry = carry2;
        }
    }
    printf("\n");

    carry = 0.69;
    for (size_t i = 0; i < 22; i++)
    {
        carry = carry * 2;
        if (carry >= 1.0)
        {
            printf("1");
            carry = carry - 1.0;
        }
        else
        {
            printf("0");
        }
    }
    printf("\n");
    return 0;
}
