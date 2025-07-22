module netdelay1(x,y);
input x;
output y;
wire #(32,32) nn; // Declare wire 'nn' with rise=32, fall=32 delay
not #($bits(nn)-$bits(x)) (nn,x); // Assign NOT(x) to 'nn' (takes effect after rise/fall delay)
assign y=nn; // Assign 'nn' to 'y' (direct assignment)
endmodule

# Test Cases

### Test Case 1:
input x;
output y;
wire #(32,32) nn;
not #($bits(nn)-$bits(x)) (nn,x);
assign y = nn[0:1] & nn[2:3];

# Test Results

### Test Case 1:
input x;
output y;
wire #(32,32) nn;
not #($bits(nn)-$bits(x)) (nn,x);
assign y = nn[0:1] & nn[2:3];

# Analysis

### Execution:
$./vsim test_case1.v
### Result:
![TestResult1](https://github.com/Fangyi-Wang/ECE521/blob/master/Assignment4/TestResults/TestResult1.png)

### Conclusion and Analysis:
This test can be used to verify the delay requirement of the design. The net delay is defined as (rise+fall)/2, therefore, the wire rise time is 32ns and the wire fall time is 32ns. This is satisfied with the delay requirements, so the test is passed.

# References

[1] https://www.edaplayground.com/x/62f
;

int main()
{
    int in1, in2;
    cout << "Input 1st Number: "; cin >> in1;
    cout << "Input 2nd Number: "; cin >> in2;

    int sum = add(in1, in2);
    cout << in1 << " + " << in2 << " = " << sum << endl;

    return 0;
}#include <iostream>
using namespace std;

/*Function:
int add(int a, int b)
Parameters:
a, b - input value
Return:
int - sum of a and b
*/
int add(int a, int b)
{
    return a + b;
}

/*Function:
int mult(int a, int b)
Parameters:
a, b - input value
Return:
int - product of a and b
*/
int mult(int a, int b)
{
    return a * b;
}

/*Function:
void printString(char *c)
Parameters:
c - pointer to char array
Return:
None
*/
void printString(char *c)
{
    cout << c << endl;
}

/*Function:
int max(int a, int b)
Parameters:
a, b - input value
Return:
int - value of maximum of a and b
*/
int max(int a, int b)
{
    if (a > b)
        return a;
    else
        return b;
}

/*Function:
int isEven(int a)
Parameters:
a - input value
Return:
int - 0 if a is odd, 1 if a is even
*/
int isEven(int a)
{
    if (a % 2 == 0)
        return 1;
    else
        return 0;
}

/*Function:
int add_even(int a, int b)
Parameters:
a, b - input value
Return:
int - result of a + b if a and b both are even, 0 otherwise
*/
int add_even(int a, int b)
{
    if (isEven(a) && isEven(b))
        return a + b;
    else
        return 0;
}

/*Function:
int add_even_odd(int a, int b)
Parameters:
a, b - input value
Return:
int - result of a + b if a and b both are odd, 0 otherwise
*/
int add_even_odd(int a, int b)
{
    if (!isEven(a) &&!isEven(b))
        return a + b;
    else
        return 0;
}

/*Function:
int main()
Parameters:
None
Return:
Integer - 0
*/
int main()
{
    int in1, in2, in3, in4;
    cout << "Input 1st Number: "; cin >> in1;
    cout << "Input 2nd Number: "; cin >> in2;
    cout << "Input 3rd Number: "; cin >> in3;
    cout << "Input 4th Number: "; cin >> in4;

    cout << in1 << " + " << in2 << " = " << add(in1, in2) << endl;
    cout << in3 << " * " << in4 << " = " << mult(in3, in4) << endl;
    cout << add(in1, in2) << " + " << add(in3, in4) << " = " << add(add(in1, in2), add(in3, in4)) << endl;
    cout << add(in1, in2) << " + " << add(in3, in4) << " = " << add(add(in1, in2), add(in3, in4)) << endl;
    cout << in1 << " + " << in2 << " = " << add(in1, in2) << endl;

    cout << "max(" << in1 << "," << in2 << ") = " << max(in1, in2) << endl;

    cout << isEven(in1) << endl;
    cout << isEven(in2) << endl;

    cout << add_even(in1, in2) << endl;
    cout << add_even_odd(in1, in2) << endl;
    cout << add_even(in1, in2) << endl;
    cout << add_even_odd(in1, in2) << endl;

    return 0;
}

struct sInt
{
    int x, y;
};

struct sInt *p;

struct sInt *pointToStruct()
{
    return &p->x;
}

int sum(int *x, int *y);

int sum(int *x, int *y)
{
    return *x + *yAssignment 1: Design of a Register

# Abstract

The goal of this assignment is to design of a register. This assignment is based on the given design.

# Background

A VHDL-defined register is usually a 4-bits wide register. As a general rule of thumb, in a 4-bits wide register, the 3-bit wide register is called a flip-flop and the 1-bit wide register is called a memory cell.

A 4-bits wide register can be divided into 4 individual 1-bit wide memory cells. Since a flip-flop takes 2 inputs and 1 output, a 4-bits wide register can be divided into 2 flip-flops. Therefore, the 4-bits wide register can be implemented into a 2-bit wide register.

# Design

As mentioned above, a 4-bits wide register consists of 4 individual 1-bit wide flip-flop. The 4-bits wide register can be implemented into a 2-bit wide register.

I consider the 4-bits wide register as a clocked data path. The 2-bits wide register is regarded as a clocked data path. Therefore, the clocked data path has only 1 input and 1 output.

The clocked data path is defined by the 2-bits wide register, and the 1-bit wide flip-flop. The clocked data path is regarded as a 2-input 1-output combinational logic unit. As a result, the clocked data path can be implemented into the flip-flop.

The 2-bits wide register is regarded as a clocked data path. The 1-bit wide flip-flop is regarded as a clocked data path. The 1-bit wide flip-flop is regarded as a 2-input 1-output combinational logic unit. The 1-bit wide flip-flop is a sequential logic unit.

The 2-bits wide register contains 2 1-bit wide flip-flops. Therefore, the 2-bits wide register is regarded as a clocked data path. The 1-bit wide flip-flop is regarded as a clocked data path. The 1-bit wide flip-flop is regarded as a 2-input 1-output combinational logic unit. The 1-bit