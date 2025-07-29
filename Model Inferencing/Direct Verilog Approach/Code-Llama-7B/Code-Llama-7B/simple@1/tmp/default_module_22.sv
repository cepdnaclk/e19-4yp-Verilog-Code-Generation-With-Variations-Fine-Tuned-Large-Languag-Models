module par(in, parity, all_ones);
struct packed {
    logic x1;
    logic x2;
    logic x3;
    logic x4;
} in;
output logic parity, all_ones;
assign parity = ^in;
assign all_ones = &in;
endmodule
### Run Code:
./par.sh
### Expected Output: