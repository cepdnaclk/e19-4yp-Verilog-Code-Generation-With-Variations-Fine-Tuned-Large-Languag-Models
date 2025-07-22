module shift_reg( input [3:0] d_in, input clk, sr, sl, ld, rst,
input [1:0] s_cnt, output reg [3:0] q);
reg [3:0] int_q;
genvar g;
generate
for ( g = 0; g < 2; g = g + 1 )
begin: inside
always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
if( ld )
int_q = d_in;
else if( sr )
int_q = q >> s_cnt;
else if( sl )
int_q = q << s_cnt;
else int_q = q;
end
end
endgenerate
always @( posedge clk ) begin: register
if (rst) q <= 0;
else q <= int_q;
end
endmodule
### Example Run(s):
```
Example 1:
dut.uut.i8080_core.inside[0].d_in
Example 2:
dut.uut.i8080_core.inside[0].q
```
### Result:
### Base Logic:

```
always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
if( ld )
int_q = d_in;
else if( sr )
int_q = q >> s_cnt;
else if( sl )
int_q = q << s_cnt;
else int_q = q;
end
```
### Variation Logic:
```
always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
if( ld )
int_q = d_in;
else if( sr )
int_q = q >> s_cnt;
else if( sl )
int_q = q << s_cnt;
else int_q = q;
end
```