``` verilog
module sr_gen( input [3:0] d_in, input clk, sr, sl, ld, rst,
input [1:0] s_cnt, output reg [3:0] q);
reg [3:0] int_q;
generate
if (USE_SHIFT_REG) begin
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
end
end else begin
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
end
end
endgenerate
endmodule
```
### Reference Code:
```verilog
// Original Verilog code
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
always