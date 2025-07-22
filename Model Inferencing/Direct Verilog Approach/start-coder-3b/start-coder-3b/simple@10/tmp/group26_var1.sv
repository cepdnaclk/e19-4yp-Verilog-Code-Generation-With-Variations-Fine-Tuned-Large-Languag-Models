module my_module(input [2:0] I, output reg [2:0] O);

reg clk;
wire rst;
wire [2:0] DIN;
reg [2:0] Q;

reg [2:0] F;

always @(posedge clk) begin
case (rst)
1'b0:
Q <= 1'b0;
1'b1:
Q