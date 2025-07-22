module mult_rnd(output [31:0] Q, output [31:0] R, input [31:0] A, input [31:0] B);
wire [31:0] AxB = A*B;
wire [31:0] AxB_i3;
wire [31:0] AxB_i2;
wire [3:0] AxB_i2_i3;
assign AxB_i2 = AxB_i3 << 3;
assign AxB_i2_i3 = AxB_i2