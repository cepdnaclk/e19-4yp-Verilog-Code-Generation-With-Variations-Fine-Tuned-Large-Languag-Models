module ALUTest2 (
parameter INT_BITS  = 4,
parameter INT_WIDE  = 16,
parameter INT_SIZE  = 32,
parameter INT_WIDTH = 16,
input wire   CLK,
input wire   RESET,
input wire   start,
input wire   carry_in,
output wire  carry_out,
output wire  result_out
);

// 4-bit signed (signed 2's complement) integer arithmetic
//

// input variables
parameter signed signed_WIDTH = 4;
parameter signed signed_WIDE = 32;
parameter signed signed_SIZE = 64;

input wire [signed_WIDE-1:0] a;
input wire [signed_WIDE-1:0] b;

// output variables
parameter signed result_WIDTH = 4;
parameter signed result_WIDE = 32;
parameter signed result_SIZE = 64;

output wire [result_WIDE-1:0] result;

wire [result_WIDTH-1:0] carry_out;
wire [result_WIDTH-1:0] result_out;

// ALU unit
ALU2 U_ALU (.CLK(CLK),.RESET(RESET),.start(start),.a(a),.b(b),
.carry_in(carry_in),.carry_out(carry_out),.result_out(result_out),
.result(result) );

// stimulus unit
stimulus2 U_stim (.CLK(CLK),.RESET(RESET),.start(start),.result_WIDTH(result_WIDTH),.result_WIDE(result_WIDE),.result_SIZE(result_SIZE),
.result_out(result_out),.carry_out(carry_out) );

endmodule
### Testbench:
module stimulus (
input wire         CLK,
input wire         RESET,
input wire         start,
input wire         carry_in,
output wire [4:0]   carry_out,
output wire [4:0]   result_out
);

initial begin
RESET <= 1;
CLK <= 0;
while (CLK == 1)
CLK <= 0;
end

forever #30 clk = 1;

endmodule
## Results
To test the signed integer arithmetic, it was done by inserting four test cases into the ALU testbench. One of the test cases is a negative number (–4). The other three test cases are positive numbers (0, 1, 4). The results of each test case are shown in the table below.

The results of the signed integer arithmetic are as expected.

## Conclusion
In this lab, the verilog HDL code of the ALU unit is created, using the verilog HDL modeling method. The ALU unit is modified to add two 4-bit signed numbers by using two 4-bit registers.

The ALU unit is tested by inserting four test cases in the ALU testbench. The results are as expected.

## Summary
In this lab, the following Verilog HDL elements were learned:

• How to create a logic circuit using combinatorial logic and sequential logic.
• How to create a combinatorial logic circuit using the HDL modeling method.
• How to create a sequential logic circuit using the HDL modeling method.
• How to run the simulator and the Vivado project using the Vivado compiler.
• How to insert the test case into the testbench.
• How to create a parameterized testbench.
• How to simulate the HDL code.
• How to use the logic analyzer to analyze the data.

## Acknowledgment

I would like to thank the Instructor, Dr., for providing the course materials and giving me the opportunity to work on the assignments.

©, University of Waterloo