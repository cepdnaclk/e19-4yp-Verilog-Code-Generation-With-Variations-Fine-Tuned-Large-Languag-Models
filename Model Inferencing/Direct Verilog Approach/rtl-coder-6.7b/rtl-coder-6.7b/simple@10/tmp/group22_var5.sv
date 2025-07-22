module par(in, parity, all_ones);
input [7:0] in;
output parity, all_ones;
typedef struct packed{
logic x1;
logic x2;
logic x3;
logic x4;
}in_field;
in_field i;
assign i = in;
assign parity = ^i;
assign all_ones = &i;
endmodule