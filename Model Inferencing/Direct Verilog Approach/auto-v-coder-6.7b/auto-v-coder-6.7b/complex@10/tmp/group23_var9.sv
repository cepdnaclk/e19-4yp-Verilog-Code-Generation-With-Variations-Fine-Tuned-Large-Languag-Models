```verilog
module shift_reg( input [3:0] d_in, input clk, sr, sl, ld, rst,
input [1:0] s_cnt, output reg [3:0] q);
reg [3:0] int_q;
always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
if( ld )
int_q = d_in;
else if( sr )
int_q = q >> s_cnt;
else if( sl )
int_q = q << s_cnt;
else int_q = q;
end
always @( posedge clk ) begin: register
if (rst) q <= 0;
else q <= int_q;
end
endmodule

`define CHECK_INSIDE(x,y) ( x <= y[0] && y[0] <= x+y[1] )
`define PACK(x,y) `{x,y}
`define SPECIAL_CHECK(x,y,z) `CHECK_INSIDE(x, `PACK(y,z))

generate
if (`SPECIAL_CHECK(2,3,4)) begin: inside
shift_reg #(.REG_A(2),.REG_B(3)) (
       .d_in(d_in),
       .clk(clk),
       .sr(sr),
       .sl(sl),
       .ld(ld),
       .rst(rst),
       .s_cnt(s_cnt),
       .q(q)
);
end
endgenerate
```
The above code introduces the use of preprocessor directives `define` for constant values and macros to create special conditions for checking and packing specific values, which is then used in the generate block. The `inside` check is replaced with the macros in the generate block. This approach allows for a more flexible control on the logic instantiation.

This code should be compiled with the appropriate directives and the appropriate compiler (Verilog or SystemVerilog) is used.

Please note that this example is a simplified form and may not cover all the