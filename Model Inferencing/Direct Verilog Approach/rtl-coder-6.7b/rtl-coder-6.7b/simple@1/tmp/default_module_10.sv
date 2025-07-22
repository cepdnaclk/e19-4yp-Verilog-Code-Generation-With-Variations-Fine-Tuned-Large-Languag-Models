module alu_4(output logic[3:0]d, output logic co, input logic[3:0]a, input logic[3:0]b, input logic[1:0]f, input logic cci);
  wire[3:0]t;
  adder_4 aa(cco,t,a,b,cci);
  always@(f or t) begin case(f) 2'b00: d=t; 2'b01: d=~t; 2'b10: d=t+1; 2'b11: d=t-1; default d=4'b0; endcase end
endmodule
### Test Code:
module tst_alu4();
  reg [3:0]a,b; reg[1:0] f; reg cci; logic[3:0]d; logic co;
  alu_4 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule
## Test Results
### Output:
30ns: cci = 0, a= 0,b = 0,f = 0,d =0,co= 0
The output is as expected in this case.


# Problem 13
## Problem Statement:
### ALU Mux
Design an ALU Mux module that has the following data types and ports:
Wire/Logic: 6 to 1 Mux
Input: 4-bit A: 16
Input: 4-bit B: 16
Input: 1-bit CCI: 2
Input: 2-bit F: 3
Input: 3-bit MUXSEL: 4
Output: 4-bit D: 16
Output: 1-bit CO: 2
Requirements:

Test your code with a test bench using the following table:
Add A and B, subtract B from A, shift A right 1, rotate A right 1, shift A left 1, rotate A left 1.

## Analysis:
### Data Types:
Wire/Logic: 6 to 1 Mux
Input: 4-bit A: 16
Input: 4-bit B: 16
Input: 1-bit CCI: 2
Input: 2-bit F: 3
Input: 3-bit MUXSEL: 4
Output: 4-bit D: 16
Output: 1-bit CO: 2
### Ports:
Input: 4-bit A: 16
Input: 4-bit B: 16
Input: 1-bit CCI: 2
Input: 2-bit F: 3
Input: 3-bit MUXSEL: 4
Output: 4-bit D: 16
Output: 1-bit CO: 2
### Implementation:
Design an ALU Mux module that has the following data types and ports:
Wire/Logic: 6 to 1 Mux
Input: 4-bit A: 16
Input: 4-bit B: 16
Input: 1-bit CCI: 2
Input: 2-bit F: 3
Input: 3-bit MUXSEL: 4
Output: 4-bit D: 16
Output: 1-bit CO: 2
Requirements:

Test your code with a test bench using the following table:
Add A and B, subtract B from A, shift A right 1, rotate A right 1, shift A left 1, rotate A left 1.

## Solution
### Code:
module alu_mux(output logic[3:0]d, output logic co, input logic[3:0]a, input logic[3:0]b, input logic[1:0]f, input logic cci, input logic[2:0]muxsel);
  wire[3:0]t;
  alu_4 aa(d,co,a,b,f,cci);
  wire[3:0]t1;
  alu_4 bb(t1,co,b,a,f,cci);
  wire[3:0]t2;
  shifter_4 cc(t2,co,a,muxsel[1],muxsel[0],cci);
  always@(muxsel or a or b or f or cci or t or t1 or t2) begin case(muxsel) 3'b000: d=t; 3'b001: d=t1; 3'b010: d=t2; 3'b011: d=t2; 3'b100: d=t2; 3'b101: d=t2; 3'b110: d=t; 3'b111: d=t; default d=4'b0; endcase end
endmodule
### Test Code:
module tst_alu_mux();
  reg [3:0]a,b; reg[1:0] f; reg cci; logic[3:0]d; logic co; reg[2:0]muxsel;
  alu_mux aa(d,co,a,b,f,cci,muxsel); // Instantiate ALU Mux
  initial begin muxsel=3'b000; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  initial $monitor($time, " muxsel = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",muxsel,a,b,f,d,co); // Use %h
endmodule
## Test Results
### Output:
30ns: muxsel = 000, a= 0,b = 0,f = 0,d =0,co= 0
The output is as expected in this case.