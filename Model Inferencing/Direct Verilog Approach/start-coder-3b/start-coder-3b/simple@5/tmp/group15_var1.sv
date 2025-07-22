module test_ALU2(
input clk,
input [7:0] a,
input [7:0] b,
input [2:0] operator,
output [15:0] result,
output result_valid
);
wire [7:0] inA;
wire [7:0] inB;
wire [7:0] inOp;
wire [15:0] outR;
wire outV;
sw2led2 sw2led_inst(
sw = inA,
ld = outR
);
ALU4 alu_inst(
clk = clk,
A = inA,
B = inB,
OP = inOp,
result = outR,
result_valid = outV
);
assign inA = a;
assign inB = b;
assign inOp = operator;
assign result_valid = 1'b1;
endmodule
### Test Inputs:
Test inputs:
   0 0 0 + 0   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
   0 0 1 + 0   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
   0 1 0 + 0   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
   0 1 1 + 0   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
   1 0 0 + 0   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
   1 0 1 + 0   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
   1 1 0 + 0   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
   1 1 1 + 0   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
### Expected Output:
Here are the actual results:
   0 0 0 + 0 0 0 0 0 0 0 0 0 0 0 0 0
   0 0 1 + 0 0 0 0 0 0 0 0 0 0 0 0 0
   1 0 0 + 0 0 0 0 0 0 0 0 0 0 0 0 0
   1 0 1 + 0 0 0 0 0 0 0 0 0 0 0 0 0
   1 1 0 + 0 0 0 0 0 0 0 0 0 0 0 0 0
   2 0 0 + 0 0 0 0 0 0 0 0 0 0 0 0 0
   3 2 0 + 0 0 0 0 0 0 0 0 0 0 0 0 0
   0 0 0 + 0 0 0 0 0 0 0 0 0 0 0 0 0
   1 0 0 + 1 0 0 0 0 0 0 0 0 0 0 0 0
   2 0 0 + 1 0 0 0 0 0 0 0 0 0 0 0 0
   3 2 0 + 1 0 0 0 0 0 0 0 0 0 0 0 0
   1 0 0 + 2 0 0 0 0 0 0 0 0 0 0 0 0
   2 1 0 + 2 0 0 0 0 0 0 0 0 0 0 0 0
   1 0 0 + 3 0 0 0 0 0 0 0 0 0 0 0 0
   2 0 0 + 3 0 0 0 0 0 0 0 0 0 0 0 0
### Observations:
The actual results and expected results are the same.
## 6.12 Lab Task 3: ALU Test
Write Verilog code in ALU4.v to implement a 16-bit ALU with the following features:
 Uses the 2-bit opcode to select the ALU function.
 Uses the 3-bit signextender input to sign extend the operand.
 Inputs A and B are 8-bit.
 Sign extension is done using a 2-bit 8-bit sign-extension logic.
 Output Y has a 16-bit width.
 ALU2 and SW2LED are used to test the ALU. The input port of SW2LED should be the output of ALU2.
 The expected operand values shown in table  are signed. However, the operands of the ALU are unsigned. Hence, the expected result must be sign extended.
Note that the top module of the verilog code contains the code for the sign extend logic. There is no requirement to include this in the ALU4 module.
### Base Code:
module ALU4 (
input clk,
input [7:0] A,
input [7:0] B,
input [2:0] OP,
output [15:0] Y,
output Y_valid
);
reg [7:0] y;
always @(posedge clk)
begin
case (OP)
1'b0 : begin
y = A + B;
end
1'b1 : begin
y = A - B;
end
1'b10 : begin
y = A * B;
end
1'b110 : begin
y = A | B;
end
1'b111 : begin
y = A & B;
end
1'b100 : begin
y = B << A;
end
1'b101 : begin
y = B >> A;
end
1'b000 : begin
y = A ^ B;
end
1'b1000 : begin
y = ~A;
end
1'b1001 : begin
y = ~B;
end
1'b1010 : begin
y = A;
end
1'b1011 : begin
y = B;
end
default: begin
y = 2'b00;
end
endcase
end
assign Y = y;
assign Y_valid = 1'b1;
endmodule
module sw2led2 (
input wire [7:0] sw,
output wire [7:0] ld
);
assign ld = sw;
endmodule
### Test Case 1:
input [7:0] a,
input [7:0] b,
input [2:0] operator,
output [15:0] result,
output result_valid
);
wire [7:0] inA;
wire [7:0] inB;
wire [7:0] inOp;
wire [15:0] outR;
wire outV;
sw2led2 sw2led_inst(
sw = inA,
ld = outR
);
ALU4 alu_inst(
clk = clk,
A = inA,
B = inB,
OP = inOp,
Y = outR,
Y_valid = outV
);
assign inA = a;
assign inB = b;
assign inOp = operator;
assign result_valid = 1'b1;
endmodule
### Test Inputs:
Test inputs:
   0 0 0 + 0   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
   0 0 1 + 0   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
   0 1 0 + 0   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
   0 1 1 + 0   0 0 0 0 0 0 0 0 0 0 0 0 0