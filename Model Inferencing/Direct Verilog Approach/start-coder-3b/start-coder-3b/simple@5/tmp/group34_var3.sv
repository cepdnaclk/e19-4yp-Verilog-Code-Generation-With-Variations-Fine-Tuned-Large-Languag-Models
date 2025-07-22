// Create a module with one input and one output that behaves like a wire
module wire_assign( input in, output out );
    // assign out to in
    assign out = in;
endmodule#ifndef INCLUDE_H
#define INCLUDE_H
#include <iostream>
#include <string>
#include <stdio.h>
#include "C:/Users//Desktop/Verilog Code/Header_Files/bit_operations.h"

//
// File:   c:\Users\\Desktop\Verilog Code\Source Files\inc.h
// Author: 
// Created on March 4, 2018, 1:35 AM
//

using namespace std;

// This function gets the number of bits in an integer number
int numOfBits(int integer);

// This function gets the number of ones in an integer number
int numOfOnes(int integer);

// This function gets the number of zeros in an integer number
int numOfZeros(int integer);

// This function adds two arrays of bits and returns the answer
int *BitAdd(int *num1, int *num2);

// This function substracts two arrays of bits and returns the answer
int *BitSub(int *num1, int *num2);

// This function multiplies two arrays of bits and returns the answer
int *BitMul(int *num1, int *num2);

// This function divides two arrays of bits and returns the answer
int *BitDiv(int *num1, int *num2);

// This function multiplies two arrays of bits and returns the answer
int *BitMod(int *num1, int *num2);

// This function divides two arrays of bits and returns the answer
int *BitDiv(int *num1, int *num2);

// This function computes bitwise NOT of an array of bits
int *BitNot(int *num1);

// This function computes bitwise AND of two arrays of bits
int *BitAnd(int *num1, int *num2);

// This function computes bitwise OR of two arrays of bits
int *BitOr(int *num1, int *num2);

// This function computes bitwise XOR of two arrays of bits
int *BitXor(int *num1, int *num2);

// This function computes bitwise XNOR of two arrays of bits
int *BitXNor(int *num1, int *num2);

// This function computes bitwise NAND of two arrays of bits
int *BitNand(int *num1, int *num2);

// This function computes bitwise NOR of two arrays of bits
int *BitNor(int *num1, int *num2);

// This function computes bitwise EQU of two arrays of bits
int *BitEqu(int *num1, int *num2);

// This function computes bitwise NEQ of two arrays of bits
int *BitNeq(int *num1, int *num2);

// This function prints out an array of bits
void PrintArray(int *num1);

// This function gets the result of an operation and prints it
void PrintFunction(int *num1, int *num2, char operatorSymbol, char functionName);


#endif /* INCLUDE_H */

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.c
 * Author: 
 *
 * Created on April 11, 2018, 11:36 PM
 */

#include "C:/Users//Desktop/Verilog Code/Header_Files/include.h"
#include "C:/Users//Desktop/Verilog Code/Header_Files/functions.h"

/*
 * 
 */
int main(void) {
    int option;
    char op;
    int *num1;
    int *num2;
    bool firstNum = false;
    bool secondNum = false;
    bool isOperator = false;
    bool isFunction = false;
    
    printf("Enter your numbers: ");
    printf("\n\t0 - Ending the program\n");
    
    option = getchar();
    
    // This loop is used to continue to get numbers and check their validity
    // It also prints out the answer of different operations
    while (option!= 48) {
        // This condition checks if the user entered a number or not
        if (isdigit(option)) {
            // When the user did enter a number, it gets the number into a dynamic array
            num1 = getNumber(num1, 0, option, &firstNum);
        }
        else if(option == 42) { // User entered an operator
            if (firstNum == true) { // The user entered at least one number
                while (isOperator == false) {
                    printf("\nEnter your operator: ");
                    op = getchar();
                    // This checks if the user entered an operator or not
                    if (op == 45) {
                        printf("You entered a minus (-) symbol.");
                        printf("\n\t0 - Ending the program\n");
                        printf("\n\t1 - Enter your next number\n");
                        printf("\n\t2 - Enter your next operator\n");
                        printf("\n\t3 - Print the answer\n");
                        scanf("%d", &option);
                        if (option == 1) {
                            isOperator = true;
                        }
                        else if (option == 2) {
                            isOperator = true;
                        }
                        else if (option == 3) {
                            PrintFunction(num1, num2, op, "Subtraction");
                            isOperator = true;
                        }
                        else if (option == 0) {
                            PrintFunction(num1, num2, op, "Subtraction");
                            exit(EXIT_SUCCESS);
                        }
                        else {
                            printf("You entered invalid option.");
                            option = getchar();
                        }
                    }
                    else if (op == 43) {
                        printf("You entered a plus (+) symbol.");
                        printf("\n\t0 - Ending the program\n");
                        printf("\n\t1 - Enter your next number\n");
                        printf("\n\t2 - Enter your next operator\n");
                        printf("\n\t3 - Print the answer\n");
                        scanf("%d", &option);
                        if (option == 1) {
                            isOperator = true;
                        }
                        else if (option == 2) {
                            isOperator = true;
                        }
                        else if (option == 3) {
                            PrintFunction(num1, num2, op, "Addition");
                            isOperator = true;
                        }
                        else if (option == 0) {
                            PrintFunction(num1, num2, op, "Addition");
                            exit(EXIT_SUCCESS);
                        }
                        else {
                            printf("You entered invalid option.");
                            option = getchar();
                        }
                    }
                    else if (op == 47) {
                        printf("You entered a division (/) symbol.");
                        printf("\n\t0 - Ending the program\n");
                        printf("\n\t1 - Enter your next number\n");
                        printf("\n\t2 - Enter your next operator\n");
                        printf("\n\t3 - Print the answer\n");
                        scanf("%d", &option);
                        if (option == 1) {
                            isOperator = true;
                        }
                        else if (option == 2) {
                            isOperator = true;
                        }
                        else if (option == 3) {
                            PrintFunction(num1, num2, op, "Division");
                            isOperator = true;
                        }
                        else if (option == 0) {
                            PrintFunction(num1, num2, op, "Division");
                            exit(EXIT_SUCCESS);
                        }
                        else {
                            printf("You entered invalid option.");
                            option = getchar();
                        }
                    }
                    else if (op == 42) {
                        printf("You entered a multiplication (*) symbol.");
                        printf("\n\t0 - Ending the program\n");
                        printf("\n\t1 - Enter your next number\n");
                        printf("\n\t2 - Enter your next operator\n");
                        printf("\n\t3 - Print the answer\n");
                        scanf("%d", &option);
                        if (option == 1) {
                            isOperator = true;
                        }
                        else if (option == 2) {
                            isOperator = true;
                        }
                        else if (option ==