```verilog
module shift_reg( input [3:0] d_in, input clk, sr, sl, ld, rst,
input [1:0] s_cnt, output reg [3:0] q);
wire [2:0] rr_ir;

always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
if( ld )
rr_ir <= d_in;
else if( sr )
rr_ir <= q >> s_cnt;
else if( sl )
rr_ir <= q << s_cnt;
else rr_ir <= q;
end

always @( posedge clk ) begin: register
if (rst) q <= 0;
else q <= rr_ir;
end
endmodule
```
This will give the desired output. Please note that the `rr_ir` wire should be a 3-bit wide wire because the input to the `rr_ir` should be a 3-bit wide value. If it's 4-bit wide, then it may lead to unexpected results.

The generate block was removed since it was not required in this specific code. However, if you want to extend this to any kind of data, then you would need to add it and define what the `rr_ir` wire should be.### End###```verilog
module shift_reg( input [3:0] d_in, input clk, sr, sl, ld, rst,
input [1:0] s_cnt, output reg [3:0] q);
wire [2:0] rr_ir;

always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
if( ld )
rr_ir <= d_in;
else if( sr )
rr_ir <= q >> s_cnt;
else if( sl )
rr_ir <= q << s_cnt;
else rr_ir <= q;
end

always @( posedge clk ) begin: register
if (rst) q <= 0;
else q <= rr_ir;
end