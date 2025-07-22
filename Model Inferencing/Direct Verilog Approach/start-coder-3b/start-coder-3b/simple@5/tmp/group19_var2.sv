module tb(Clock, Resetn);
// Input parameters
integer i, ii;
input Clock, Resetn;

reg array [5:0] D [32];

// Instantiate flipflop module
dff_inst dff0(D[0], Clock, Resetn, Q0);
dff_inst dff1(D[1], Clock, Resetn, Q1);
dff_inst dff2(D[2], Clock, Resetn, Q2);
dff_inst dff3(D[3], Clock, Resetn, Q3);
dff_inst dff4(D[4], Clock, Resetn, Q4);

assign Q0 = Q1;
assign Q1 = Q2;
assign Q2 = Q3;
assign Q3 = Q4;

begin

// Set the reset signal to 0
Resetn = 0;

// Wait for one clock cycle
#1;

// Run the tests
Resetn = 1;
#50;
Resetn = 0;

always @(posedge Clock)
D[0] <= D[0] + 1;

always @(posedge Clock)
D[1] <= D[1] + 1;

always @(posedge Clock)
D[2] <= D[2] + 1;

always @(posedge Clock)
D[3] <= D[3] + 1;

always @(posedge Clock)
D[4] <= D[4] + 1;

endmodule

### Expected Behavior:
The behavior of the program is the same as before.

## 4.7.5 Exercise: Flipflop with Dynamic Array

## 4.7.6 Variation Instruction:
Expand the testbench to include test cases using a dynamic array as input operands.

## 4.7.7 Expected Behavior:
The behavior of the program is the same as before.

## 4.8 Summary

This chapter has introduced a number of design concepts and components that you can use to construct larger designs.

## 4.9 Exercises

The following exercises are designed to help you become familiar with the design tools for Verilog. The first five exercises are intended for students who are new to Verilog and the rest for those who have some experience with Verilog.

You can find the solutions to these exercises at the end of the chapter.

1. Use the Vivado Design Suite to synthesize the following flipflop implementation.
• Note: In the Verilog code, the data register is called D.
module dff_inst(D, Clock, Resetn, Q);
input D, Clock, Resetn;
output Q;
lpm_ff flipflop(.data(D),.aclr(Resetn),.clock(Clock),.q(Q));
defparam flipflop.lpm_width = 1;
endmodule
2. Expand the testbench to include test cases using a dynamic array as input operands.
3. Expand the testbench to include test cases using a dynamic array as output operands.
4. Modify the testbench in Exercise 3 to include both clock and reset signals.
5. Modify the testbench in Exercise 4 to include both clock and reset signals.
6. Modify the testbench in Exercise 5 to include both clock and reset signals.