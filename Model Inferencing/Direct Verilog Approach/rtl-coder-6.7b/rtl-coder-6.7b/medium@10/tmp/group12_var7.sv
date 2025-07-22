module maj3 (a, b, c, y);
input a, b, c;
output y;
wire im1, im2, im3;
always @(*) begin
#1 w_muxed_out = a_muxed_out[1];
#1 b_muxed_out = b_muxed_out[0];
#1 c_muxed_out = b_muxed_out[0];
#### The original code here is broken ###
### The new code is correct ###
#1 w_muxed_out = a_muxed_out[1:0][0];
#1 b_muxed_out = b_muxed_out[0:1][1];
#1 c_muxed_out = b_muxed_out[0:1][0];
end
### Testbench
`default_nettype none

module tb_maj3 ();

logic [2:0] a;
logic [2:0] b;
logic [2:0] c;
logic [2:0] y;
logic [2:0] y_gold;


maj3 maj3_model(.a(a),.b(b),.c(c),.y(y_gold));
maj3 maj3_dut(.*);

task test(input logic [2:0] a, b, c, output logic [2:0] y);
a = a;
b = b;
c = c;
#1 y = a + b + c;
endtask

logic [2:0] a_cand, b_cand, c_cand, y_cand;

initial begin

test(0, 0, 0, y_gold);
test(0, 0, 1, y_gold);
test(0, 1, 0, y_gold);
test(0, 1, 1, y_gold);
test(1, 0, 0, y_gold);
test(1, 0, 1, y_gold);
test(1, 1, 0, y_gold);
test(1