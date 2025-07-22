module shift_register(
input wire [3:0] d,
input wire clk,
input wire [3:0] q,
output reg [3:0] q_new
);
always @ (posedge clk)

XMR:    with (clk) {
XMR:      { YMR: 0 : q_new = q; }
XMR:      { YMR: 1 : q_new = d; }
XMR:    }

endmodule
### Result:

## Related articles

You May Also Like:

### XMR-style Indexing

XMR-style index expressions are available in the Verilog standard, a widely adopted language extension in order to express hardware designs in a more compact and efficient manner. In this tutorial, we will cover the basics of the language extension, and in the next article, as well as in other articles, we will show the most versatile use cases of XMR-style index expressions.