package par;
typedef struct packed {
logic [7:0] in;
} par;
endpackage
module par(par);
input par;
output parity, all_ones;
assign parity = ^par.in;
assign all_ones = &par.in;
endmodule