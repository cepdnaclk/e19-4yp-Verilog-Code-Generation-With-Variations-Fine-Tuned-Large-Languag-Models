module ALU (output [31:0] Result, input [31:0] ArgA, ArgB, input Clk);
specify
    specparam tRise = 5, tFall = 4;
    (Clk *> Result) = (tRise, tFall);
    (ArgA, ArgB) ='s(ArgA, ArgB);
endspecify
endmodule


## DUT Parameters
The DUT (Design Under Test) is a top level module comprised of the ALU, the ALU Testbench, and the ALU Testbench Testbench. The top level module is used to instantiate the 3 different ALU variants as well as the Testbench. The Testbench is used to test the top level module, specifically to run the 3 different tests and also to generate the test case parameters. The Testbench does not include the top level module. The ALU has 6 input signals and one output signal. The ALU output signal is 32 bits and has a time to rise and time to fall attributes of 5 and 4 clock cycles respectively. The ALU input signals have time to rise attributes of 10 and 2 clock cycles respectively.

## Testbench Parameters
The testbench is comprised of the same 6 input signals found in the DUT and their respective time to rise and time to fall attributes. The testbench has the following input signals: ArgA, ArgB, CLK, Reset_N, and Test_N.

The following input signals have time to rise attributes of 10 and 2 clock cycles respectively.

ArgA has a time to rise attribute of 10 clock cycles.

ArgB has a time to rise attribute of 2 clock cycles.

CLK has a time to rise attribute of 5 clock cycles.

Reset_N has a time to rise attribute of 5 clock cycles.

Test_N has a time to rise attribute of 5 clock cycles.

The following input signals have time to fall attributes of 10 and 2 clock cycles respectively.

ArgA has a time to fall attribute of 10 clock cycles.

ArgB has a time to fall attribute of 2 clock cycles.

CLK has a time to fall attribute of 5 clock cycles.

Reset_N has a time to fall attribute of 5 clock cycles.

Test_N has a time to fall attribute of 5 clock cycles.

The following 6 registers are used in the testbench:

Reg_Clk has a reset value of 0.

Reg_RST has a reset value of 0.

Reg_TST has a reset value of 0.

Reg_A has a reset value of 0.

Reg_B has a reset value of 0.

Reg_CLK has a reset value of 0.

The testbench has a clock signal, CLK, that is used to generate the 3 different variations of the ALU. The clock signal has a time to rise of 1 clock cycle.

The testbench has 2 reset signals, Reset_N and Test_N. The Test_N signal is used to generate the 3 different variations of the ALU. The Test_N signal has a time to rise of 5 clock cycles. The Test_N signal has a time to fall of 5 clock cycles. The reset signal is used to reset the registers and to start the tests. The Reset_N signal has a time to rise of 5 clock cycles. The Reset_N signal has a time to fall of 5 clock cycles.

## Testbench Description
The testbench follows the same steps as in the lecture notes:

1. Reset the registers to their reset values.

2. Set the Test_N signal to 0.

3. Set the Reset_N signal to 0.

4. Set the Reset_N signal to 1. Wait 5 clock cycles.

5. Set the Reset_N signal to 0.

6. Set the Reset_N signal to 1. Wait 5 clock cycles.

7. Set the Reset_N signal to 0.

8. Set the ArgA input signal to 0.

9. Set the ArgB input signal to 0.

10. Wait for the ArgA input signal to fall.

11. Set the ArgA input signal to 1.

12. Set the ArgB input signal to 1.

13. Wait for the ArgA and ArgB input signals to rise.

14. Set the Test_N signal to 1. Wait 5 clock cycles.

15. Set the Test_N signal to 0.

16. Set the Reset_N signal to 1. Wait 5 clock cycles.

17. Set the Reset_N signal to 0.

The testbench also generates the test cases that will be run. The test cases are created by:

1. Setting the ArgA and ArgB input signals to 0.

2. Setting the Test_N signal to 1. Wait 5 clock cycles.

3. Setting the Test_N signal to 0.

4. Setting the Reset_N signal to 1. Wait 5 clock cycles.

5. Setting the Reset_N signal to 0.

6. Setting the ArgA and ArgB input signals to 1.

7. Setting the Test_N signal to 1. Wait 5 clock cycles.

8. Setting the Test_N signal to 0.

9. Setting the Reset_N signal to 1. Wait 5 clock cycles.

10. Setting the Reset_N signal to 0.

11. Setting the ArgA and ArgB input signals to 1.

12. Setting the Test_N signal to 1. Wait 5 clock cycles.

13. Setting the Test_N signal to 0.

14. Setting the Reset_N signal to 1. Wait 5 clock cycles.

15. Setting the Reset_N signal to 0.

For each of the 12 test cases, the testbench will generate 12 different variations of the ALU by modifying the ArgA and ArgB input signals in a specific manner. To generate the first variation of the ALU, the user must set the ArgA and ArgB input signals to 0.

To generate the second variation of the ALU, the user must set the ArgA and ArgB input signals to -0.

To generate the third variation of the ALU, the user must set the ArgA and ArgB input signals to 1.

To generate the fourth variation of the ALU, the user must set the ArgA and ArgB input signals to -1.

To generate the fifth variation of the ALU, the user must set the ArgA and ArgB input signals to -1.

To generate the sixth variation of the ALU, the user must set the ArgA and ArgB input signals to 1.

To generate the seventh variation of the ALU, the user must set the ArgA and ArgB input signals to -1.

To generate the eighth variation of the ALU, the user must set the ArgA and ArgB input signals to 0.

To generate the ninth variation of the ALU, the user must set the ArgA and ArgB input signals to 0.

To generate the tenth variation of the ALU, the user must set the ArgA and ArgB input signals to 1.

To generate the eleventh variation of the ALU, the user must set the ArgA and ArgB input signals to 1.

To generate the twelfth variation of the ALU, the user must set the ArgA and ArgB input signals to 1.

The testbench will have the following functions:

void ALUFunc(void);
void ALUFunc_Signed_Addition(void);
void ALUFunc_Signed_Subtraction(void);
void ALUFunc_Signed_Multiplication(void);

The ALUFunc function is a wrapper function that will call the 3 different ALU functions depending on the value of the Test_N signal. The ALUFunc function has an if and else if statement that checks if the Test_N signal is 0, 1, or 2. If the Test_N signal is 0, the ALUFunc function will call the ALUFunc_Signed_Addition function. Otherwise if the Test_N signal is 1, the ALUFunc function will call the ALUFunc_Signed_Subtraction function. Otherwise if the Test_N signal is 2, the ALUFunc function will call the ALUFunc_Signed_Multiplication function.

The ALUFunc_Signed_Addition function is used to add two signed numbers.

The ALUFunc_Signed_Subtraction function is used to subtract two signed numbers.

The ALUFunc_Signed_Multiplication function is used to multiply two signed numbers.

The testbench will have the following functions:

void ALUFunc(void);
void ALUFunc_Signed_Addition(void);
void ALUFunc_Signed_Subtraction(void);
void ALUFunc_Signed_Multiplication(void);

The