module Anding (input a, b, output y);
    and (y, a, b);
    endmodule
    module DFF (
        input [3:0]     d,
        input           clk,
        input           clear,
        output reg [3:0] q);
    and (q[3:0], d, q, clear, clk);
    endmodule
### Compile Command:
    ncverilog -sv tb.v DFF.v
### Result:
    tb.v:24: warning: 56: (vlog-891) Input port `d' of module instance `DFF' is not connected.
    tb.v:25: warning: 56: (vlog-891) Input port `clk' of module instance `DFF' is not connected.
    tb.v:26: warning: 56: (vlog-891) Input port `clear' of module instance `DFF' is not connected.
    tb.v:27: warning: 56: (vlog-891) Input port `q' of module instance `DFF' is not connected.
    tb.v:18: warning: 46: (vlog-416) Default value of port `d' is ignored since it is a packed union.
    tb.v:18: warning: 46: (vlog-416) Default value of port `clk' is ignored since it is a packed union.
    tb.v:18: warning: 46: (vlog-416) Default value of port `clear' is ignored since it is a packed union.
    tb.v:18: warning: 46: (vlog-416) Default value of port `q' is ignored since it is a packed union.
    tb.v:24: warning: 56: (vlog-891) Input port `d' of module instance `DFF' is not connected.
    tb.v:25: warning: 56: (vlog-891) Input port `clk' of module