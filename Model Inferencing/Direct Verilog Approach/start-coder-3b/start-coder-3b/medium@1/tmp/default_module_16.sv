module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output reg [3:0] y
);
always @(*)
if(s)
y = b;
else
y = a;
endmodule
### New Verilog Code:
module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output reg [3:0] y
);
always @(*)
if(s == 1)
y = b;
else
y = a;
endmodule

## 3.2.12 mux24b_testbench.v

module testbench(
);
reg clk = 0;
reg rst_n = 0;
reg [3:0] d[24] = 0;
reg [3:0] s[24] = 0;
reg [3:0] out[24] = 0;
reg [3:0] sel[3] = 0;
initial
begin
rst_n = 1;
#10 rst_n = 0;
#10
begin
for(int i = 0; i < 24; i++) begin
#1 clk = 1; clk = 0;
end
end

for(int i = 0; i < 24; i++) begin
#1 d[i] = 4'h5+i; s[i] = 4'h8;
#1 sel[i] = 4'h7;
#1 out[i] = 4'h0;
#15 d[i] = 4'h5+i; s[i] = 4'h8; sel[i] = 4'h7;
#1 out[i] = 4'h0;
end
#20
end
endmodule

## 3.2.13 mux8_16way_24to1.v

module mux8_16way_24to1(
input wire [1:0] a,
input wire [3:0] b,
input wire s,
output reg y
);
always @(*)
if(s == 0) begin
if(a == 0) begin
y = b[0];
end
else if(a == 1) begin
y = b[1];
end
else if(a == 2) begin
y = b[2];
end
else if(a == 3) begin
y = b[3];
end
end
else if(s == 1) begin
if(a == 0) begin
y = b[4];
end
else if(a == 1) begin
y = b[5];
end
else if(a == 2) begin
y = b[6];
end
else if(a == 3) begin
y = b[7];
end
end
else if(s == 2) begin
if(a == 0) begin
y = b[8];
end
else if(a == 1) begin
y = b[9];
end
else if(a == 2) begin
y = b[10];
end
else if(a == 3) begin
y = b[11];
end
end
else if(s == 3) begin
if(a == 0) begin
y = b[12];
end
else if(a == 1) begin
y = b[13];
end
else if(a == 2) begin
y = b[14];
end
else if(a == 3) begin
y = b[15];
end
end
end
endmodule

## 3.2.14 mux8_16way_24to1_testbench.v

module testbench(
);
reg clk = 0;
reg rst_n = 0;
reg [1:0] d[8] = 0;
reg [3:0] s[8] = 0;
reg [3:0] out[16] = 0;
reg [3:0] sel[2] = 0;
initial
begin
rst_n = 1;
#10 rst_n = 0;
#10
begin
for(int i = 0; i < 8; i++) begin
#1 clk = 1; clk = 0;
end
end

for(int i = 0; i < 8; i++) begin
#1 d[i] = 4'h5+i; s[i] = 4'h8;
#1 sel[i] = 4'h7;
#1 out[i] = 4'h0;
#15 d[i] = 4'h5+i; s[i] = 4'h8; sel[i] = 4'h7;
#1 out[i] = 4'h0;
end
#20
end
endmodule