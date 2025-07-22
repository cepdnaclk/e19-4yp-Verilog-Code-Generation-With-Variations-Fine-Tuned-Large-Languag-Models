module Problem8_1(input [3:0] a, b, output [3:0] diff);
reg [3:0] packedStruct;
assign packedStruct = {a, b};
assign diff = packedStruct[1] - packedStruct[2];
endmodule// 
// 3/20/2020
// Lab3
// Problem 1
// Description:
// This program will take an input number, perform an operation with it and the output the result. the program will also keep track of the number of
// operations it has performed.
#include <stdio.h>
#include <stdlib.h>
#include "operations.h"

int main() {

    int inputNumber;
    char selection;

    while (1) {
        printf("Enter your selection: ");
        scanf("%c", &selection);
        printf("\n");

        switch (selection) {
            case '0':
                printf("Program ended.\n");
                return 0;
            case '1':
                printf("You selected add\n");
                printf("Enter your number: ");
                scanf("%d", &inputNumber);
                printf("The result of adding %d and 2 is %d\n", inputNumber, add(inputNumber));
                printf("Number of operations performed: %d\n", getNumOps());
                break;
            case '2':
                printf("You selected subtract\n");
                printf("Enter your number: ");
                scanf("%d", &inputNumber);
                printf("The result of subtracting %d and 2 is %d\n", inputNumber, subtract(inputNumber));
                printf("Number of operations performed: %d\n", getNumOps());
                break;
            case '3':
                printf("You selected multiply\n");
                printf("Enter your number: ");
                scanf("%d", &inputNumber);
                printf("The result of multiplying %d and 2 is %d\n", inputNumber, multiply(inputNumber));
                printf("Number of operations performed: %d\n", getNumOps());
                break;
            case '4':
                printf("You selected divide\n");
                printf("Enter your number: ");
                scanf("%d", &inputNumber);
                printf("The result of dividing %d and 2 is %d\n", inputNumber, divide(inputNumber));
                printf("Number of operations performed: %d\n", getNumOps());
                break;
            default:
                printf("Error, try again.\n");
                break;
        }

    }
}
// 
// 3/20/2020
// Lab3
// Problem 5
// Description:
// This program will take an input number, perform an operation with it and the output the result. the program will also keep track of the number of
// operations it has performed.

#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#include <string.h>

void *myMalloc(size_t size) {
    void *ptr = malloc(size);
    if (ptr == NULL) {
        printf("Error: malloc failed.\n");
        exit(0);
    }
    memset(ptr, 0, size);
    return ptr;
}

int main(int argc, char *argv[]) {
    int *ptr;
    size_t size;

    if (argc < 2) {
        printf("Error: Incorrect usage, enter in the number of bytes to allocate.\n");
        exit(0);
    }

    size = atoi(argv[1]);
    printf("Allocating %zu bytes\n", size);
    ptr = myMalloc(size);
    printf("Address: %p\n", ptr);
    free(ptr);
    return 0;
}
# Computer Architecture Labs

These are my lab assignments for CS303E
// 
// 3/20/2020
// Lab3
// Problem 3
// Description:
// This program will print out all the numbers from 1 to 100 and then print out the numbers that are divisible by both 3 and 5.
// it will also print out the numbers that are divisible by 3 or 5.


#include <stdio.h>

int main() {

    printf("Number multiples of 3 or 5 from 1 to 100:\n");

    for (int i = 1; i <= 100; ++i) {
        if (i % 3 == 0 || i % 5 == 0) {
            printf("%d\n", i);
        }
    }

    printf("Number multiples of 3 and 5 from 1 to 100:\n");

    for (int i = 1; i <= 100; ++i) {
        if (i % 3 == 0 && i % 5 == 0) {
            printf("%d\n", i);
        }
    }
    return 0;
}
// 
// 3/14/2020
// Lab2
// Problem 1
// Description:
// This program will sum the user inputted numbers and print out the resulting value.

#include <stdio.h>

int main() {
    float inputNumber;
    float inputNumber2;
    float total;

    printf("Enter your first number: ");
    scanf("%f", &inputNumber);
    printf("Enter your second number: ");
    scanf("%f", &inputNumber2);

    total = inputNumber + inputNumber2;

    printf("Your result: %f\n", total);

    return 0;
}
#define _POSIX_C_SOURCE 200112L
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

int main (int argc, char **argv) {
    if (argc!= 4) {
        printf("Incorrect number of arguments, enter the filename, the user id, and the group id\n");
        return -1;
    }

    char *filename = argv[1];
    uid_t uid = atoi(argv[2]);
    gid_t group = atoi(argv[3]);
    if (uid < 0 || group < 0) {
        printf("Invalid user id or group id, must be a positive or zero number\n");
        return -1;
    }

    int result = chown(filename, uid, group);
    if (result < 0) {
        printf("Failed to change ownership\n");
        return -1;
    }

    return 0;
}
#include "operations.h"

static int numOps;

void init() {
    numOps = 0;
}

int add(int number) {
    init();
    numOps++;
    return number + 2;
}

int subtract(int number) {
    init();
    numOps++;
    return number - 2;
}

int multiply(int number) {
    init();
    numOps++;
    return number * 2;
}

int divide(int number) {
    init();
    numOps++;
    return number / 2;
}

int getNumOps() {
    return numOps;
}
// 
// 3/20/2020
// Lab3
// Problem 4
// Description:
// This program will take an input number, perform an operation with it and the output the result. the program will also keep track of the number of
// operations it has performed.

#include <stdio.h>
#include <stdlib.h>
#include "operations.h"

int main() {

    int inputNumber;
    char selection;

    while (1) {
        printf("Enter your selection: ");
        scanf("%c", &selection);
        printf("\n");
        int op = 0;
        switch (selection) {
            case '0':
                printf("Program ended.\n");
                return 0;
            case '1':
                printf("You selected add\n");
                printf("Enter your number: ");
                scanf("%d", &inputNumber);
                op = add(inputNumber);
                printf("The result of adding %d and 2 is %d\n", inputNumber, op);
                printf("Number of operations performed: %d\n", getNumOps());
                break;
            case '2':
                printf("You selected subtract\n");
                printf("Enter your number: ");
                scanf("%d", &inputNumber);
                op = subtract(inputNumber);
                printf("The result of subtracting %d and 2 is %d\n", inputNumber, op);
                printf("Number of operations performed: %d\n", getNumOps());
                break;
            case '3':
                printf("You selected multiply\n");
                printf("Enter your number: ");
                scanf("%d", &inputNumber);
                op = multiply(inputNumber);
                printf("The result of multiplying %d and 2 is %d\n", inputNumber, op);
                printf("Number of operations performed: %d\n", getNumOps());
                break;
            case '4':
                printf("