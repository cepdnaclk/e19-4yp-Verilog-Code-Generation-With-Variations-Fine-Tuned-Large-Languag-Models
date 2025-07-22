module par(in, parity, all_ones);
input [7:0] in;
output parity, all_ones;

typedef struct packed {
logic [0:0] x1;
logic [0:0] x2;
logic [0:0] x3;
logic [0:0] x4;
} packed;

packed par;

assign par.x1 = in[0];
assign par.x2 = in[1];
assign par.x3 = in[2];
assign par.x4 = in[3];

assign parity = ^par;
assign all_ones = &par;
endmodule
### Verification Code:
module par_test;
logic [7:0] in;
wire parity, all_ones;

par dut (in, parity, all_ones);

// test bench begin
// test bench end

initial begin
parity = 0;
all_ones = 0;
#1 in=8'b00000000;
#1 $display("%d %d", parity, all_ones); // expected: 1 0
#1 in=8'b11111111;
#1 $display("%d %d", parity, all_ones); // expected: 0 1
#1 in=8'b01001010;
#1 $display("%d %d", parity, all_ones); // expected: 1 0
#1 in=8'b00011111;
#1 $display("%d %d", parity, all_ones); // expected: 0 1
$finish;
end
endmodule