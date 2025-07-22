// Verilog code for Problem 4
module XOR_Gate_Array(
    input [1:0] A, B,
    output Y
);
    assign Y = A ^ B;
endmodule#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "functions.h"

int main(int argc, char* argv[])
{
    struct node* head = createNode(0);
    int num_nodes_added = 0;
    char* command_list[] = {
        "add",
        "remove",
        "list",
        "exit"
    };

    if(argc < 2)
    {
        printf("ERROR: Invalid number of arguments.\n");
        return 1;
    }

    // Open file containing commands
    FILE* file = fopen(argv[1], "r");
    if(file == NULL)
    {
        printf("ERROR: Could not open input file.\n");
        return 2;
    }

    char* command;
    char* value;
    int data;

    while(fscanf(file, "%s", &command)!= EOF)
    {
        // Ignore blank lines in input file
        char* comment = strchr(command, '#');
        if(comment!= NULL) continue;

        // Check which command is being used
        if(strcmp(command, command_list[0]) == 0)
        {
            fscanf(file, "%d", &data);
            num_nodes_added = add_item(head, data);
        }
        else if(strcmp(command, command_list[1]) == 0)
        {
            fscanf(file, "%d", &data);
            int removed = remove_item(head, data);
            if(removed >= 0)
            {
                // printf("Removed %d from index %d.\n", data, removed);
                printf("Removed %d\n", data);
            }
            else
            {
                printf("Item not found in list.\n");
            }
        }
        else if(strcmp(command, command_list[2]) == 0)
        {
            print_list(head);
        }
        else if(strcmp(command, command_list[3]) == 0)
        {
            if(num_nodes_added == 0)
            {
                printf("No items in list.\n");
            }
            free(head);
            printf("Goodbye!\n");
            return 0;
        }
        else
        {
            printf("Unrecognized command.\n");
        }

        printf("\n");
    }

    printf("ERROR: Could not read input file.\n");
    return 4;
}#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "functions.h"

int main(int argc, char* argv[])
{
    // Get number of elements in initial array
    int* array = getArray(argv[1]);

    // Get number of threads to use
    int threads = atoi(argv[2]);

    // Execute parallel function
    int* sum = (int*)malloc(sizeof(int));
    *sum = 0;
    parallel_sum(array, threads, &(*sum));

    // Free array and sum
    free(array);
    free(sum);

    return 0;
}# CSCI-330
## Fall 2021

This repository contains projects from my CSCI-330 course (Fall 2021) at Binghamton University.

### Projects

- Lab 1: Basic C/C++
- Lab 2: Memory Management
- Lab 3: Data Structures
- Lab 4: Simulation
- Lab 5: C++ & Qt
- Lab 6: Multi-Threading
- Lab 7: Web Programming
- Lab 8: Databases
- Lab 9: SQL
- Lab 10: Machine Learning
- Lab 11: Parallel Programming
- Lab 12: Computer Architecture
- Final Project: A Simple Neural Network#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "functions.h"

int main(int argc, char* argv[])
{
    // Get number of elements in initial array
    int* array = getArray(argv[1]);

    // Get number of threads to use
    int threads = atoi(argv[2]);

    // Execute parallel function
    int* sum = (int*)malloc(sizeof(int));
    *sum = 0;
    parallel_sum(array, threads, &(*sum));

    // Print result and free array
    printf("Sum: %d\n", *sum);
    free(array);

    return 0;
}#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
    int* array = (int*)malloc(sizeof(int));
    int index = 0;
    char c;
    int i = 0;

    // Get array
    while(1)
    {
        c = getchar();
        if(c == EOF)
        {
            break;
        }
        else if(c == '\n')
        {
            array[index] = i;
            i = 0;
            index++;
            array = (int*)realloc(array, (index + 1) * sizeof(int));
        }
        else if(c =='')
        {
            array[index] = i;
            i = 0;
            index++;
            array = (int*)realloc(array, (index + 1) * sizeof(int));
        }
        else
        {
            i *= 10;
            i += (c - '0');
        }
    }

    // Print array
    for(i = 0; i < index; i++)
    {
        printf("%d\n", array[i]);
    }

    // Clear array
    free(array);

    return 0;
}#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct node
{
    char* key;
    char* val;
    struct node* next;
} node;

void insert_item(node* head, char* key, char* val);
char* lookup_item(node* head, char* key);
void delete_item(node* head, char* key);
void print_list(node* head);

int main(int argc, char* argv[])
{
    char* command_list[] = {
        "insert",
        "lookup",
        "delete",
        "print",
        "exit"
    };

    if(argc < 2)
    {
        printf("ERROR: Invalid number of arguments.\n");
        return 1;
    }

    // Create head node
    node* head = (node*)malloc(sizeof(node));
    head->key = NULL;
    head->val = NULL;
    head->next = NULL;

    // Open input file
    FILE* file = fopen(argv[1], "r");
    if(file == NULL)
    {
        printf("ERROR: Could not open file.\n");
        return 2;
    }

    char* command;
    char* key;
    char* val;

    char c;
    while(fscanf(file, "%c", &c)!= EOF)
    {
        // Ignore spaces and tabs
        if(c == '\n' || c =='' || c == '\t') continue;

        // Read in command
        command = (char*)malloc(256 * sizeof(char));
        int i = 0;
        while(1)
        {
            c = fgetc(file);
            if(c == '\n')
            {
                command[i] = '\0';
                break;
            }
            else
            {
                command[i] = c;
                i++;
            }
        }

        // Check which command is being used
        if(strcmp(command, command_list[0]) == 0)
        {
            // Read in key
            key = (char*)malloc(256 * sizeof(char));
            i = 0;
            while(1)
            {
                c = fgetc(file);
                if(c == '\n') break;
                if(c =='' || c == '\t') break;

                key[i] = c;
                i++;
            }
            key[i] = '\0';
            // Read in value
            val = (char*)malloc(256 * sizeof(char));
            i = 0;
            while(1)
            {
                c = fgetc(file);
                if(c == '\n') break;
                if(c =='' || c == '\t') break;

                val[i] = c;
                i++;
            }
            val[i] = '\0';

            // Add item to list
            insert_item(head, key, val);
        }
        else if(strcmp(command, command_list[1]) == 0)
        {
            // Read in key
            key = (char*)malloc(256 * sizeof(char));
            i = 0;
            while(1)
            {
                c = fgetc(file);
                if(c == '\n') break;
                if(c =='' || c == '\t') break;

                key[i] = c;
                i