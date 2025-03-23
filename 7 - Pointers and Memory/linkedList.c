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

int main(int argc, char const *argv[])
{
    printf("%i\n", NULL == 0);
    struct listNode *sc = NULL;

    // struct listNode *node1 = malloc(sizeof(struct listNode));
    // node1->studentNum = 3;
    // node1->grade = 3;
    // node1->next = NULL;

    // struct listNode node2;
    // node2.studentNum = 1012;
    // node2.grade = 93;

    // struct listNode node3;
    // node3.studentNum = 1076;
    // node3.grade = 85;

    // struct listNode *node4 = malloc(sizeof(struct listNode));
    // node4->studentNum = 4;
    // node4->grade = 44;

    // sc = node1;
    addRecord(&sc, 1, 1);
    addRecord(&sc, 2, 2);
    addRecord(&sc, 4, 4);
    addRecord(&sc, 5, 5);

    struct listNode *tp = sc;
    while (true)
    {
        if (tp == NULL)
            break;
        printf("Student #%i: %i\n", tp->studentNum, tp->grade);
        tp = tp->next;
    }

    return 0;
}
