module Half_Adder(
    input logic [1:0] A, B,
    output logic [1:0] Sum, Carry
);
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule
### Output for Problem 5:
// Half Adder Testbench 
module Half_Adder_tb();
    // Inputs
    logic [1:0] A = 1'b0;
    logic [1:0] B = 1'b0;

    // Outputs
    logic [1:0] Sum;
    logic [1:0] Carry;

    // Instantiate the Module
    Half_Adder half_adder (
       .A(A),.B(B),.Sum(Sum),.Carry(Carry)
    );

    initial begin
        $dumpfile("Half_Adder_tb.vcd");
        $dumpvars(0, Half_Adder_tb);
    end
endmodule
### Output for Problem 6:
// Half Adder Testbench
module Half_Adder_tb();
    // Inputs
    logic A, B;

    // Outputs
    logic Sum, Carry;

    // Instantiate the Module
    Half_Adder half_adder (
       .A(A),.B(B),.Sum(Sum),.Carry(Carry)
    );

    initial begin
        $dumpfile("Half_Adder_tb.vcd");
        $dumpvars(0, Half_Adder_tb);
    end
endmodule
### Output for Problem 7:
// Full Adder Testbench
module Full_Adder_tb();
    // Inputs
    logic [1:0] A, B, Cin;

    // Outputs
    logic [1:0] Sum, Cout;

    // Instantiate the Module
    Full_Adder full_adder (
       .A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout)
    );

    initial begin
        $dumpfile("Full_Adder_tb.vcd");
        $dumpvars(0, Full_Adder_tb);
    end
endmodule
### Output for Problem 8:
// Full Adder Testbench
module Full_Adder_tb(
    logic [1:0] A = 1'b0, B = 1'b0, Cin = 1'b0,
    logic [1:0] Sum, Cout
);
    // Inputs
    logic [1:0] A, B, Cin;

    // Outputs
    logic [1:0] Sum, Cout;

    // Instantiate the Module
    Full_Adder full_adder (
       .A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout)
    );

    initial begin
        $dumpfile("Full_Adder_tb.vcd");
        $dumpvars(0, Full_Adder_tb);
    end
endmodule
### Output for Problem 9:
// Full Adder Testbench
module Full_Adder_tb(
    logic A = 1'b0, B = 1'b0, Cin = 1'b0,
    logic Sum, Cout
);
    // Inputs
    logic [1:0] A, B, Cin;

    // Outputs
    logic [1:0] Sum, Cout;

    // Instantiate the Module
    Full_Adder full_adder (
       .A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout)
    );

    initial begin
        $dumpfile("Full_Adder_tb.vcd");
        $dumpvars(0, Full_Adder_tb);
    end
endmodule
### Output for Problem 10:
// Full Adder Testbench
module Full_Adder_tb;
    // Inputs
    logic [1:0] A, B, Cin;

    // Outputs
    logic [1:0] Sum, Cout;

    // Instantiate the Module
    Full_Adder full_adder (
      .A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout)
    );

    initial begin
        $dumpvars(0, Full_Adder_tb);
    end
endmodule
### Output for Problem 11:
// Full Adder Testbench
module Full_Adder_tb;
    // Inputs
    logic [1:0] A, B, Cin;

    // Outputs
    logic [1:0] Sum, Cout;

    // Instantiate the Module
    Full_Adder full_adder (
       .A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout)
    );

    initial begin
        $dumpvars(0, Full_Adder_tb);
    end
endmodule
### Output for Problem 12:
// Full Adder Testbench
module Full_Adder_tb;
    // Inputs
    logic [1:0] A = 1'b0, B = 1'b0, Cin = 1'b0;

    // Outputs
    logic [1:0] Sum, Cout;

    // Instantiate the Module
    Full_Adder full_adder (
       .A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout)
    );

    initial begin
        $dumpvars(0, Full_Adder_tb);
    end
endmodule
### Output for Problem 13:
// Full Adder Testbench
module Full_Adder_tb;
    // Inputs
    logic [1:0] A, B, Cin;

    // Outputs
    logic [1:0] Sum, Cout;

    // Instantiate the Module
    Full_Adder full_adder (
       .A()A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout)
    );

    initial begin
        $dumpvars(0, Full_Adder_tb);
    end
endmodule
### Output for Problem 14:
// Full Adder Testbench
module Full_Adder_tb;
    // Inputs
    logic [1:0] A, B, Cin;

    // Outputs
    logic [1:0] Sum, Cout;

    // Instantiate the Module
    Full_Adder full_adder (
       .A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout)
    );

    initial begin
        $dumpvars(0, Full_Adder_tb);
    end
endmodule
### Output for Problem 15:
// Full Adder Testbench
module Full_Adder_tb;
    // Inputs
    logic A, B, Cin;

    // Outputs
    logic Sum, Cout;

    // Instantiate the Module
    Full_Adder full_adder (
       .A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout)
    );

    initial begin
        $dumpvars(0, Full_Adder_tb);
    end
endmodule
### Output for Problem 16:
// Full Adder Testbench
module Full_Adder_tb;
    // Inputs
    logic A, B, Cin;

    // Outputs
    logic Sum, Cout;

    // Instantiate the Module
    Full_Adder full_adder (
       .A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout)
    );

    initial begin
        $dumpvars(0, Full_Adder_tb);
    end
endmodule
### Output for Problem 17:
// Full Adder Testbench
module Full_Adder_tb;
    // Inputs
    logic [1:0] A, B, Cin;

    // Outputs
    logic [1:0] Sum, Cout;

    // Instantiate the Module
    Full_Adder full_adder (
       .A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout)
    );

    initial begin
        $dumpvars(0, Full_Adder_tb);
    end
endmodule
### Output for Problem 18:
// Full Adder Testbench
module Full_Adder_tb;
    // Inputs
    logic [1:0] A, B, Cin;

    // Outputs
    logic [1:0] Sum, Cout;

    // Instantiate the Module
    Full_Adder full_adder (
       .A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout)
    );

    initial begin
        $dumpvars(0, Full_Adder_tb);
    end
endmodule
/Labs/Lab4/Test Code/Lab4_1_Example.cpp
#include <iostream>
#include "Lab4_1.h"

using namespace std;

int main(int argc, char const *argv[])
{
    int n;
    // int N = 10;
    cout << "Enter the value of n: ";
    cin >> n;
    cout << "The factorial of your input is: " << factor