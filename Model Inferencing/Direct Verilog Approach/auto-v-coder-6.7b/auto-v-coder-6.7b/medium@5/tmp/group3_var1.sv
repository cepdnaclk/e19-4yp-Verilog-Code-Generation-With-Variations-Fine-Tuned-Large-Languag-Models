```verilog
module FA;
    input x, y, ci;
    output sum, co;

    assign sum = x ^ y ^ ci;
    assign co  = (x & y) | (x & ci) | (y & ci);
endmodule

module Sum(sum, ci, a, b, c, d);
    input a, b, c, d, ci;
    output sum;

    wire [3:0] fa_outs;

    FA fa0(.x(a),.y(b),.ci(ci),.sum(fa_outs[0]),.co());
    FA fa1(.x(c),.y(d),.ci(fa_outs[0]),.sum(fa_outs[1]),.co());
    FA fa2(.x(fa_outs[0]),.y(fa_outs[1]),.ci(fa_outs[2]),.sum(fa_outs[3]),.co());
    FA fa3(.x(fa_outs[2]),.y(fa_outs[3]),.ci(fa_outs[3]),.sum(sum),.co());
endmodule

module Ripple_Add;