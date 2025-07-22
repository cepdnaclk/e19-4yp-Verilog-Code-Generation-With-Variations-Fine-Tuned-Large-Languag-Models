module par(in, parity, all_ones);
input [7:0] in;
logic x1, x2, x3, x4;
struct packed {
logic x1, x2, x3, x4;
} in_struct;
output parity, all_ones;
assign {x1, x2, x3, x4} = in;
assign parity = ^in;
assign all_ones = &in;
endmodule
### Testbench Code:
module par_tb;
logic [7:0] in;
logic parity, all_ones;
par test_par(in, parity, all_ones);
initial begin
test_par.x1 = 1'b1;
test_par.x2 = 1'b1;
test_par.x3 = 1'b1;
test_par.x4 = 1'b1;
#10;
$display("parity output is %h", parity);
$display("all_ones output is %h", all_ones);
end
endmodule