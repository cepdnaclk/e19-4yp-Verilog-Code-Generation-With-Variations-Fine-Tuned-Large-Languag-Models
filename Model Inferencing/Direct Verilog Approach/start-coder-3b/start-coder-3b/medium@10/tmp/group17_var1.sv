module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
assign z = ~s[1] & ~s[0] & c[0] // Select c[0] when s=00
| ~s[1] & s[0] & c[1] // Select c[1] when s=01
| s[1] & ~s[0] & c[2] // Select c[2] when s=10
| s[1] & s[0] & c[3]; // Select c[3] when s=11
| c[1:0]; % Select c[1:0] when s=00;
| c[3:2]; % Select c[3:2] when s=01;
| c[5:4]; % Select c[5:4] when s=10;
| c[7:6]; % Select c[7:6] when s=11;
endmodule

Code block for different cases of mux41b with different inputs and test cases.

module mux41b_tb
;
; This is a simple testbench for the module mux41b
;
; This testbench checks the following cases:
;
;   Inputs:
;
;   A. s = 00, c = 00: z = c0
;   B. s = 00, c = 01: z = c1
;   C. s = 10, c = 02: z = c2
;   D. s = 11, c = 03: z = c3
;   E. s = 00, c = 10: z = c1
;   F. s = 00, c = 11: z = c3
;   G. s = 01, c = 12: z = c2
;   H. s = 01, c = 13: z = c3
;
;   Outputs:
;
;   A. c0 = 0000
;   B. c1 = 0001
;   C. c2 = 0010
;   D. c3 = 0011
;   E. c1 = 0010
;   F. c3 = 0011
;   G. c2 = 0100
;   H. c3 = 0101
;
;
;

module mux41b_tb;
reg [3:0] c = 1000;
reg [1:0] s;
wire z;

// Inputs
wire clk, rst;
reg [7:0] dataout;
integer i;

// Generate a clock and reset signal
always #5 clk = ~clk;
initial begin
clk = 1;
rst = 0;
end

// Generate test inputs and outputs
always@(posedge clk) begin
if (rst == 1) begin
s = 0;
c = 0;
end else if (c == 8'h00) begin
rst = 1;
wait;
wait;
wait;
rst = 0;
wait;
dataout = 4'hfff;
end else if (c == 8'h01) begin
s = 0;
rst = 1;
wait;
wait;
wait;
rst = 0;
wait;
dataout = 4'hffff;
end else if (c == 8'h10) begin
s = 1;
rst = 1;
wait;
wait;
wait;
rst = 0;
wait;
dataout = 4'hffff;
end else if (c == 8'h11) begin
s = 1;
rst = 1;
wait;
wait;
wait;
rst = 0;
wait;
dataout = 4'hffff;
end else if (c == 8'h10) begin
s = 1;
rst = 1;
wait;
wait;
wait;
rst = 0;
wait;
dataout = 4'hffef;
end else if (c == 8'h11) begin
s = 1;
rst = 1;
wait;
wait;
wait;
rst = 0;
wait;
dataout = 4'hfff0;
end else if (c == 8'h20) begin
s = 2;
rst = 1;
wait;
wait;
wait;
rst = 0;
wait;
dataout = 4'hffef;
end else if (c == 8'h21) begin
s = 2;
rst = 1;
wait;
wait;
wait;
rst = 0;
wait;
dataout = 4'hfff0;
end else if (c == 8'h30) begin
s = 3;
rst = 1;
wait;
wait;
wait;
rst = 0;
wait;
dataout = 4'hfff0;
end else if (c == 8'h31) begin
s = 3;
rst = 1;
wait;
wait;
wait;
rst = 0;
wait;
dataout = 4'hfff1;
end else begin
dataout = 4'hfff;
end
end

// Instantiate the module under test
mux41b uut (
.c(c),
.s(s),
.z(z)
);

endmodule

Run following commands in command line for checking the generated code,

iverilog -o mux41b_tb.out mux41b_tb.v mux41b.v
./mux41b_tb.out

Run the command ‘gtkwave’ to generate the waveform of all the input and output. You can see the simulation result below.

The code can be found here.

## Ternary Multiplexer (Ternary MUX)

The mux41b was used as a module to create mux42b in the same way and the following is the mux42b module.

module mux42b (
input wire [3:0] c0,
input wire [3:0] c1,
input wire [1:0] s,
output wire z
);
assign z = ~s[1] & ~s[0] & c0[0] // Select c0[0] when s=00
| ~s[1] & s[0] & c0[1] // Select c0[1] when s=01
| s[1] & ~s[0] & c0[2] // Select c0[2] when s=10
| s[1] & s[0] & c0[3] // Select c0[3] when s=11
| c0[1:0]; % Select c0[1:0] when s=00;
| c0[3:2]; % Select c0[3:2] when s=01;
| c0[5:4]; % Select c0[5:4] when s=10;
| c0[7:6]; % Select c0[7:6] when s=11;
| ~s[1] & ~s[0] & c1[0] // Select c1[0] when s=00
| ~s[1] & s[0] & c1[1] // Select c1[1] when s=01
| s[1] & ~s[0] & c1[2] // Select c1[2] when s=10
| s[1] & s[0] & c1[3] // Select c1[3] when s=11
| c1[1:0]; % Select c1[1:0] when s=00;
| c1[3:2]; % Select c1[3:2] when s=01;
| c1[5:4]; % Select c1[5:4] when s=10;
| c1[7:6]; % Select c1[7:6] when s=11;
endmodule

The code can be found here.

## Mux Ternary to Quaternary

The mux42b was used as a module to create mux43b in the same way and the following is the mux43b module.

module mux43b (
input wire [3:0] c0,
input wire [3:0] c1,
input wire [3:0] c2,
input