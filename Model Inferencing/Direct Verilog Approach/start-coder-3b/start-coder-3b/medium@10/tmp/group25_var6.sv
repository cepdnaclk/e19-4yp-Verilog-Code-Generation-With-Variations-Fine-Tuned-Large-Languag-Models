/31-April-2019/Project_1/Project_1_Part_2/testbench.c
#include <stdio.h>
#include <stdlib.h>
#include "my_types.h"
#include <unistd.h>
#include <time.h>

#define MAX_TEST_CASE_ELEMENTS 30

#define NUM_TEST_CASES 10
struct Test_Case{
    unsigned int input_array_size;
    unsigned int input_array[MAX_TEST_CASE_ELEMENTS];

    unsigned int input_array_size1;
    unsigned int input_array1[MAX_TEST_CASE_ELEMENTS];

    unsigned int output_array_size;
    unsigned int output_array[MAX_TEST_CASE_ELEMENTS];
};

struct Test_Case test_cases[NUM_TEST_CASES];

int main()
{
    srand(time(NULL));
    int i,j;
    for(i = 0;i < NUM_TEST_CASES;i++){
        test_cases[i].input_array_size = (rand() % 5) + 1;
        for(j = 0;j < test_cases[i].input_array_size; j++){
            test_cases[i].input_array[j] = rand() % 50;
        }

         test_cases[i].input_array_size1 = (rand() % 5) + 1;
        for(j = 0;j < test_cases[i].input_array_size1; j++){
            test_cases[i].input_array1[j] = rand() % 50;
        }

        test_cases[i].output_array_size = (rand() % 5) + 1;
        test_cases[i].output_array[0] = 0;
        for(j = 0;j < test_cases[i].output_array_size-1; j++){
            test_cases[i].output_array[j+1] = test_cases[i].input_array[j] + test_cases[i].input_array1[j];
        }

    }
}
/17-March-2019/Code/7.4__Shift_Left_Example/testbench.c
#include <stdio.h>
#include <stdlib.h>
#include "my_types.h"
#include <unistd.h>
#include <time.h>

#define MAX_TEST_CASE_ELEMENTS 30

#define NUM_TEST_CASES 10
struct Test_Case{
    unsigned int input_array_size;
    unsigned int input_array[MAX_TEST_CASE_ELEMENTS];
    unsigned int output_array_size;
    unsigned int output_array[MAX_TEST_CASE_ELEMENTS];
};

struct Test_Case test_cases[NUM_TEST_CASES];

int main()
{
    srand(time(NULL));
    int i,j;
    for(i = 0;i < NUM_TEST_CASES;i++){
        test_cases[i].input_array_size = (rand() % 4) + 1;
        for(j = 0;j < test_cases[i].input_array_size; j++){
            test_cases[i].input_array[j] = rand() % 50;
        }

        test_cases[i].output_array_size = test_cases[i].input_array_size;
        for(j = 0; j < test_cases[i].input_array_size; j++){
            test_cases[i].output_array[j] = test_cases[i].input_array[j];
        }
    }

    FILE *fp;
    fp = fopen("testbench.txt", "w");
    fprintf(fp, "unsigned int x[50];\n unsigned int y = 0;\n");
    for(i = 0; i < NUM_TEST_CASES;i++){
        fprintf(fp, "unsigned int