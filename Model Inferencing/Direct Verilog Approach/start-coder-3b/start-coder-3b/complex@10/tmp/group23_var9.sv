```
module shift_reg( input [3:0] d_in, input clk, sr, sl, ld,
input [1:0] s_cnt, output reg [3:0] q);

always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
if( ld )
int_q = d_in;
else if( sr )
int_q = int_q << s_cnt;
else if( sl )
int_q = int_q >> s_cnt;
else int_q = int_q;
end

always @( posedge clk ) begin: register
if (rst) q <= 0;
else q <= int_q;
end

endmodule
```
### Register Update

```
// initial begin: register
q <= 0;
// initial end
```
## 6. The Code Is Replaced

### Base Verilog Code: