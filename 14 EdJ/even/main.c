#include <stdio.h>
#include <stdint.h>

uint64_t num = 0;
extern uint64_t is_even(uint64_t num);



void checkEvenNum(uint64_t num)
{
    printf("%ld: %ld\n", num, is_even(num));
};


void lento(uint64_t num){
    printf("%ld: %d\n", num, num % 2 == 0);
}

int main()
{
    lento(0);
    lento(1);
    lento(2);
    lento(4);
    lento(7);
    return 0;
}
