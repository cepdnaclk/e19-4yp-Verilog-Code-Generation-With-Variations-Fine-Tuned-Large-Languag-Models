buf o(i, weak);

## 10.14.6. Tristate Register Array¶

module cta(o_dout,o_we,i_din,i_we,i_dout,i_ce,i_clr);

input  [5:0] i_din;
output i_we;
output [5:0] i_dout;
input i_ce;
input i_clr;
output [5:0] o_dout;
output o_we;

// o_dout is driven from i_dout when i_ce and i_clr are both high
buf i(o_dout, i