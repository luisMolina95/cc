#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

struct listNode
{
    int studentNum;
    int grade;
    struct listNode *next;
};

void addRecord(struct listNode **sc, int stuNum, int gr)
{
    struct listNode *newNode = malloc(sizeof(struct listNode));
    newNode->studentNum = stuNum;
    newNode->grade = gr;
    newNode->next = *sc;
    *sc = newNode;
}

double averageRecord(struct listNode *sc)
{
    if (sc == NULL)
        return 0;
    int count = 0;
    double sum = 0;
    struct listNode *loopPtr = sc;
    while (loopPtr != NULL)
    {
        sum += loopPtr->grade;
        count++;
        loopPtr = loopPtr->next;
    }
    double average = sum / count;
    return average;
}

int main(int argc, char const *argv[])
{

    struct listNode *sc = NULL;

    addRecord(&sc, 1, 1);
    addRecord(&sc, 2, 2);
    addRecord(&sc, 3, 3);
    addRecord(&sc, 5, 5);

    printf("Result: %d %f", (int)averageRecord(sc), averageRecord(sc));

    return 0;
}
