module func1(x1, x2, x3, f);
input x1, x2, x3;
output logic signed [3:0] f;
assign f = (x1 & ~x2 & ~x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
/*
 * @Author: 
 * @Date: 2019-12-04 13:02:48
 * @LastEditTime: 2019-12-09 15:02:43
 */
#include <stdio.h>
#include <string.h>
#include "func1.h"
#include "func2.h"
#include "func3.h"
#include "func4.h"
#include "func5.h"
#include "func6.h"
#include "func7.h"
#include "func8.h"
#include "func9.h"
#include "func10.h"

int main(int argc, char const *argv[]) {
    // test function 1
    int x1, x2, x3;
    int f;

    // test function 2
    int x12, x22, x32;
    int f2;
    // test function 3
    int x33, f3;
    // test function 4
    int x44, f4;
    // test function 5
    int x55, f5, x65, x75;
    int op, f6;
    // test function 6
    int x66, x76, x86, x96, f7;
    // test function 7
    int x17, x27, x37, x47, x57, f8;
    // test function 8
    int x88, x98, x108, x118, f9;
    // test function 9
    int x19, x29, x39, x49, x59, f10;
    // test function 10
    int x10, x20, x30, x40, x50, x60, x70, x80, f11;

    // function 1
    printf("func1 test:\n");
    printf("x1 x2 x3 f input?\n");
    while (scanf("%d %d %d %d", &x1, &x2, &x3, &f) == 4) {
        printf("output:%d\n", func1(x1, x2, x3));
    }

    printf("\nfunc2 test:\n");
    printf("x1 x2 x3 f input?\n");
    while (scanf("%d %d %d %d", &x12, &x22, &x32, &f2) == 4) {
        printf("output:%d\n", func2(x12, x22, x32));
    }

    printf("\nfunc3 test:\n");
    printf("x1 x2 x3 f input?\n");
    while (scanf("%d %d %d %d", &x33, &f3) == 4) {
        printf("output:%d\n", func3(x33));
    }

    printf("\nfunc4 test:\n");
    printf("x1 x2 x3 f input?\n");
    while (scanf("%d %d %d %d", &x44, &f4) == 4) {
        printf("output:%d\n", func4(x44));
    }

    printf("\nfunc5 test:\n");
    printf("x1 x2 x3 f x6 x7 op input?\n");
    while (scanf("%d %d %d %d %d %d %d %d", &x55, &x65, &x75, &op, &x10, &x20, &x30, &x40) == 8) {
        switch (op) {
        case 1:
            f5 = func5_add(x10, x20, x30, x40);
            break;
        case 2:
            f5 = func5_sub(x10, x20, x30, x40);
            break;
        case 3:
            f5 = func5_and(x10, x20, x30, x40);
            break;
        case 4:
            f5 = func5_or(x10, x20, x30, x40);
            break;
        case 5:
            f5 = func5_xor(x10, x20, x30, x40);
            break;
        case 6:
            f5 = func5_nand(x10, x20, x30, x40);
            break;
        case 7:
            f5 = func5_nor(x10, x20, x30, x40);
            break;
        case 8:
            f5 = func5_xnor(x10, x20, x30, x40);
            break;
        default:
            printf("wrong operation!\n");
            break;
        }
        printf("output:%d\n", f5);
    }

    printf("\nfunc6 test:\n");
    printf("x1 x2 x3 x4 x5 f input?\n");
    while (scanf("%d %d %d %d %d %d", &x66, &x76, &x86, &x96, &x10, &x20) == 6) {
        f7 = func6(x66, x76, x86, x96, x10, x20);
        printf("output:%d\n", f7);
    }
    printf("\nfunc7 test:\n");
    printf("x1 x2 x3 x4 x5 f input?\n");
    while (scanf("%d %d %d %d %d %d", &x17, &x27, &x37, &x47, &x57, &x60) == 6) {
        f8 = func7(x17, x27, x37, x47, x57);
        printf("output:%d\n", f8);
    }
    printf("\nfunc8 test:\n");
    printf("x1 x2 x3 x4 x5 f input?\n");
    while (scanf("%d %d %d %d %d %d", &x88, &x98, &x108, &x118, &x60, &x20) == 6) {
        f9 = func8(x88, x98, x108, x118, x60, x20);
        printf("output:%d\n", f9);
    }

    printf("\nfunc9 test:\n");
    printf("x1 x2 x3 x4 x5 f input?\n");
    while (scanf("%d %d %d %d %d %d", &x19, &x29, &x39, &x49, &x59, &x60) == 6) {
        f10 = func9(x19, x29, x39, x49, x59);
        printf("output:%d\n", f10);
    }
    printf("\nfunc10 test:\n");
    printf("x1 x2 x3 x4 x5 f input?\n");
    while (scanf("%d %d %d %d %d %d", &x10, &x20, &x30, &x40, &x50, &x60) == 6) {
        f11 = func10(x10, x20, x30, x40, x50);
        printf("output:%d\n", f11);
    }

    return 0;
}#include <Vfunc1.h>
#include <verilated.h>

int Verilated::traceEverOn = 0;
FILE* Verilated::traceF = NULL;
int Verilated::traceCalled = 0;
int Verilated::traceCallNum = 0;

void Vfunc1::eval(void) {
    if (Verilated::traceEverOn && ++Verilated::traceCallNum == Verilated::traceCallNum) {
        Verilated::traceEverOn = false;
        Verilated::traceCalled = false;
    }
    if (Verilated::traceEverOn) {
        VerilatedVcd* tfp = Verilated::traceF;