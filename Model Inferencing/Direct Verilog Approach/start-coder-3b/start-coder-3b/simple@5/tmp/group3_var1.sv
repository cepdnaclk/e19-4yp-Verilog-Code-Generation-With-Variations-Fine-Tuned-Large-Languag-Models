module full_adder (I1, I2, CIN, S, COUT);
input CIN, I1, I2;
output logic S, COUT;
assign S = I1 ^ I2 ^ CIN;
assign COUT = (I1 & I2) | (CIN & (I1 | I2));
endmodule
### Verilog Code With Multiple Verilog Modules:
module d_counter(clk, rst, i, o, count, done);
input clk, rst, i;
output logic o, count, done;
wire clk_reg;
reg [8 : 0] count;
always @(posedge clk) begin
if (rst) begin
count <= 8'h00;
end
else if (i) begin
count <= count + 1'b1;
end
end
assign count[7] = count[8];
assign o = count[7];
assign count[7] = done? 8'b00000000 : count[7];
assign done = count == 8'b11111111;
endmodule
module full_adder(I1, I2, CIN, S, COUT);
input CIN, I1, I2;
output logic S, COUT;
assign S = I1 ^ I2 ^ CIN;
assign COUT = (I1 & I2) | (CIN & (I1 | I2));
endmodule
module d_flipflop(clk, rst, i, o, n);
input clk, rst, i;
output logic o, n;
wire clk_reg;
reg n;
always @(posedge clk) begin
if (rst) begin
n <= 0;
end else if (i) begin
n <=!n;
end
end
assign o = n;
endmodule
module d_register(clk, rst, i, o);
input clk, rst, i;
output logic o;
wire clk_reg;
reg o;
always @(posedge clk) begin
if(rst) begin
o <= 0;
end
else if(i) begin
o <= i;
end
end
assign o = o;
endmodule
The design:
module full_adder (I1, I2, CIN, S, COUT);
input CIN, I1, I2;
output logic S, COUT;
assign S = I1 ^ I2 ^ CIN;
assign COUT = (I1 & I2) | (CIN & (I1 | I2));
endmodule
module d_flipflop (CLK, RST, I, O, N);
input CLK, RST, I;
output logic O, N;
wire CLK_REG;
reg N;
always @(posedge CLK) begin
if (RST) begin
N <= 0;
end
else if (I) begin
N <=!N;
end
end
assign O = N;
endmodule
module d_counter(CLK, RST, I, O, CNT, DONE);
input CLK, RST, I;
output logic O, CNT, DONE;
wire CLK_REG;
reg [8 : 0] CNT;
always @(posedge CLK) begin
if (RST) begin
CNT <= 8'h00;
end
else if (I) begin
CNT <= CNT + 1'b1;
end
end
assign CNT[7] = CNT[8];
assign O = CNT[7];
assign CNT[7] = DONE? 8'b00000000 : CNT[7];
assign DONE = CNT == 8'b11111111;
endmodule
module d_register(CLK, RST, I, O);
input CLK, RST, I;
output logic O;
wire CLK_REG;
reg O;
always @(posedge CLK) begin
if(RST) begin
O <= 0;
end
else if(I) begin
O <= I;
end
end
assign O = O;
endmodule
The output for each component:

Full Adder:

The Flipflop:

The Counter:

The Register:

The circuit, in FPGA:

### Verilog Code With Multiple Verilog Modules:
module d_counter(clk, rst, i, o, count, done);
input clk, rst, i;
output logic o, count, done;
wire clk_reg;
reg [8 : 0] count;
always @(posedge clk) begin
if (rst) begin
count <= 8'h00;
end
else if (i) begin
count <= count + 1'b1;
end
end
assign count[7] = count[8];
assign o = count[7];
assign count[7] = done? 8'b00000000 : count[7];
assign done = count == 8'b11111111;
endmodule
module full_adder(I1, I2, CIN, S, COUT);
input CIN, I1, I2;
output logic S, COUT;
assign S = I1 ^ I2 ^ CIN;
assign COUT = (I1 & I2) | (CIN & (I1 | I2));
endmodule
module d_flipflop(clk, rst, i, o, n);
input clk, rst, i;
output logic o, n;
wire clk_reg;
reg n;
always @(posedge clk) begin
if (rst) begin
n <= 0;
end else if (i) begin
n <=!n;
end
end
assign o = n;
endmodule
module d_register(clk, rst, i, o);
input clk, rst, i;
output logic o;
wire clk_reg;
reg o;
always @(posedge clk) begin
if(rst) begin
o <= 0;
end
else if(i) begin
o <= i;
end
end
assign o = o;
endmodule
module d_counter(clk, rst, i, o, count, done);
input clk, rst, i;
output logic o, count, done;
wire clk_reg;
reg [8 : 0] count;
always @(posedge clk) begin
if (rst) begin
count <= 8'h00;
end
else if (i) begin
count <= count + 1'b1;
end
end
assign count[7] = count[8];
assign o = count[7];
assign count[7] = done? 8'b00000000 : count[7];
assign done = count == 8'b11111111;
endmodule
module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output sum, cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule
module full_adder (I1, I2, CIN, S, COUT);
input CIN, I1, I2;
output logic S, COUT;
assign S = I1 ^ I2 ^ CIN;
assign COUT = (I1 & I2) | (CIN & (I1 | I2));
endmodule
module d_flipflop (CLK, RST, I, O, N);
input CLK, RST, I;
output logic O, N;
wire CLK_REG;
reg N;
always @(posedge CLK) begin
if (RST) begin
N <= 0;
end
else if (I) begin
N <=!N;
end
end
assign O = N;
endmodule
module d_register(CLK, RST, I, O);
input CLK, RST, I;
output logic O;
wire CLK_REG;
reg O;
always @(posedge CLK) begin
if(RST) begin
O <= 0;
end
else if(I) begin
O <= I;
end
end
assign O = O;
endmodule
module d_counter(CLK, RST, I, O, CNT, DONE);
input CLK, RST, I;
output logic O, CNT, DONE;
wire CLK_REG;
reg [8 : 0] CNT;
always @(posedge CLK) begin
if (RST) begin
CNT <= 8'h00;
end
else if (I) begin
CNT <= CNT + 1'b1;
end
end
assign CNT[7] = CNT[8];
assign O = CNT[7];
assign CNT[7] =