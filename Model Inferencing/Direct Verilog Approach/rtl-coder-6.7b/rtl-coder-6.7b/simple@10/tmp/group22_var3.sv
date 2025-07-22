/*
    struct packed {
        logic x1;
        logic x2;
        logic x3;
        logic x4;
    }
*/
module par(in, parity, all_ones);
input struct packed { logic x1, x2, x3, x4; } in;
output parity, all_ones;
assign parity = ^in;
assign all_ones = &in;
endmodule

/*
    struct packed {
        logic [0:0] x1;
        logic [0:0] x2;
        logic [0:0] x3;
        logic [0:0] x4;
    }
*/

module par(in, parity, all_ones);
input struct packed { logic [0:0] x1, x2, x3, x4; } in;
output parity, all_ones;
assign parity = ^in;
assign all_ones = &in;
endmodule

/*
    struct packed {
        logic [0:0] x1;
        logic [0:0] x2;
        logic [0:0] x3;
        logic [0:0] x4;
    }
*/
module par(in, parity, all_ones);
input struct packed { logic [0:0] x1, x2, x3, x4; } in;
output parity, all_ones;
assign parity = ^in;
assign all_ones = &in;
endmodule