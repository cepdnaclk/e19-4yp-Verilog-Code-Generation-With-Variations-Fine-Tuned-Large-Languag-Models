module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
case (s)
1'b0 : y = a;
1'b1 : y = b;
default : y = 'bx;
endcase
endmodule
### Result:
The Verilog code output is shown below:
3.0.3
module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
case (s)
1'b0 : y = a;
1'b1 : y = b;
default : y = 'bx;
endcase
endmodule
3.0.4
The Verilog code output is shown below:

This was an example for 2-bit MUX. In the next post of this series of posts I will be showing you how to implement 4-bit MUX.

## How to Generate Verilog Code for a 2-Bit Multiplier

Here you will learn how to generate Verilog code for 2-Bit Multiplier.

In the field of Digital Electronics, Multipliers are an important section when it comes to practical applications. A 2-Bit Multiplier is an example of a Multiplier.

Here is the Verilog code for 2-Bit Multiplier using procedural assignment:
module multiplier21a(
input wire [1:0] A,
input wire [1:0] B,
output reg [1:0] Z
);
reg [1:0] sum,tempCin,tempCout;
assign Z = {sum};
always @(*)
begin
sum = A * B;
tempCin = Z[0];
tempCout = Z[1];
end
endmodule

The Verilog code output is shown below:
3.1.1
module a(
input wire a0,
input wire a1,
input wire b0,
input wire b1,
output reg c0,
output reg c1,
output reg c2
);
reg [1:0] sum,tempCin,tempCout;
assign c0 = sum[0];
assign c1 = sum[1];
assign c2 = sum[2];
always @(*)
begin
sum = a0*b0 + a1*b1 + tempCin;
c2 = sum[2];
tempCin = tempCout;
tempCout = c2;
end
endmodule

The Verilog code output is shown below:

In the post of this series, we will see how to implement a general purpose 4 bit multiplier.

## How to Generate Verilog Code for a 4-Bit Multiplier

In this post of this series of posts, I will be showing you how to generate 4-bit Multiplier using Verilog.

Note: You can download Verilog code generated in this series of posts here.

Here is the Verilog code for 4-Bit Multiplier using procedural assignment:
module multiplier41a(
input wire [3:0] A,
input wire [3:0] B,
output wire [11:0] Z
);
reg [3:0] sum,tempCin,tempCout;
assign Z = sum;
always @(*)
begin
sum = A * B;
tempCin = Z[4];
tempCout = Z[11];
end
endmodule

The Verilog code output is shown below:
4.1.1
module a(
input wire a0,
input wire a1,
input wire a2,
input wire a3,
input wire b0,
input wire b1,
input wire b2,
input wire b3,
output reg c0,
output reg c1,
output reg c2,
output reg c3,
output reg c4,
output reg c5,
output reg c6,
output reg c7
);
reg [1:0] sum,tempCin,tempCout;
assign c0 = sum[0];
assign c1 = sum[1];
assign c2 = sum[2];
assign c3 = sum[3];
assign c4 = sum[4];
assign c5 = sum[5];
assign c6 = sum[6];
assign c7 = sum[7];
always @(*)
begin
sum = a0*b0 + a1*b1 + a2*b2 + a3*b3 + tempCin;
c7 = sum[7];
tempCin = tempCout;
tempCout = c7;
end
endmodule

The Verilog code output is shown below:

In the next post of this series, I will show you how to implement a general purpose 16 bit multiplier.

## How to Generate Verilog Code for a 16-Bit Multiplier

In this post of this series of posts, I will be showing you how to generate 16-bit Multiplier using Verilog.

Note: You can download Verilog code generated in this series of posts here.

Here is the Verilog code for 16-Bit Multiplier using procedural assignment:
module multiplier161a(
input wire [15:0] A,
input wire [15:0] B,
output wire [31:0] Z
);
reg [15:0] sum,tempCin,tempCout;
assign Z = sum;
always @(*)
begin
sum = A * B;
tempCin = Z[16];
tempCout = Z[31];
end
endmodule

The Verilog code output is shown below:
16.1.1
module a(
input wire a0,
input wire a1,
input wire a2,
input wire a3,
input wire a4,
input wire a5,
input wire a6,
input wire a7,
input wire a8,
input wire a9,
input wire a10,
input wire a11,
input wire a12,
input wire a13,
input wire a14,
input wire a15,
input wire b0,
input wire b1,
input wire b2,
input wire b3,
input wire b4,
input wire b5,
input wire b6,
input wire b7,
input wire b8,
input wire b9,
input wire b10,
input wire b11,
input wire b12,
input wire b13,
input wire b14,
input wire b15,
output reg c0,
output reg c1,
output reg c2,
output reg c3,
output reg c4,
output reg c5,
output reg c6,
output reg c7,
output reg c8,
output reg c9,
output reg c10,
output reg c11,
output reg c12,
output reg c13,
output reg c14,
output reg c15,
output reg c16,
output reg c17,
output reg c18,
output reg c19,
output reg c20,
output reg c21,
output reg c22,
output reg c23,
output reg c24,
output reg c25,
output reg c26,
output reg c27,
output reg c28,
output reg c29,
output reg c30,
output reg c31
);
reg [15:0] sum,tempCin,tempCout;
assign c0 = sum[0];
assign c1 = sum[1];
assign c2 = sum[2];
assign c3 = sum[3];
assign c4 = sum[4];
assign c5 = sum[5];
assign c6 = sum[6];
assign c7 = sum[7];
assign c8 = sum[8];
assign c9 = sum[9];
assign c10 = sum[10];
assign c11 = sum[11];
assign c12 = sum[12];
assign c13 = sum[13];
assign c14 = sum[14];
assign c15 = sum[15];
assign c16 = sum[16];
assign c17 = sum[17];
assign c18 = sum[18];
assign c19 = sum[19];
assign c20 = sum[20];
assign c21 = sum[21];
assign c22 = sum[22];
assign c23 = sum[23];
assign c24 = sum[24];
assign c25 = sum[25];
assign c26 = sum