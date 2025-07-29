```
module shift_reg( input [3:0] d_in, input clk, sr, sl, ld, rst,
input [1:0] s_cnt, output reg [3:0] q);
reg [3:0] int_q;
wire [7:0] ir_data_cmp = {5'b00000, sr, sl, ld, rst, s_cnt, 3'b000};
genvar i;
generate
for (i=0; i<8; i++)
begin: SHIFTREG_INSIDE
if (ir_data_cmp[i])
wire w_ir_data_cmp = ir_data_cmp[i];
end
endgenerate
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
```