#include <stdio.h>
#include <stdlib.h>


int main() {
    // Allocate memory blocks
    float *ptr1 = malloc(0); // 100 integers
    
    ptr1[0] = 7;
    ptr1[1] = 8;
    ptr1[2] = 9;
    ptr1[3] = 7.9999f;

    printf("%i %p\n", *ptr1);
    ptr1++;
    printf("%i %p\n", *ptr1);
    ptr1++;
    printf("%i %p\n", *ptr1);
    ptr1++;
    printf("%f %p\n", (float)*ptr1);

    free(ptr1);
    return 0;
}
