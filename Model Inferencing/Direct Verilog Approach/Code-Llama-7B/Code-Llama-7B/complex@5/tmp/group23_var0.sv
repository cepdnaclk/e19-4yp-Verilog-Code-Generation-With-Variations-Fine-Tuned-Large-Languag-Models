module shift_reg( input [3:0] d_in, input clk, sr, sl, ld, rst,
input [1:0] s_cnt, output reg [3:0] q);
parameter [3:0] P_rr_ir = 5'b00111;
localparam [3:0] LP_rr_ir = 5'b00111;
reg [3:0] int_q;
wire [3:0] rr_ir;
generate
if( rr_ir == LP_rr_ir ) begin: inside
shift_reg inst_1(.d_in( d_in ),.clk( clk ),.sr( sr ),.sl( sl ),
.ld( ld ),.rst( rst ),.s_cnt( s_cnt ),.q( int_q ));
end
endgenerate
always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
if( ld )
int_q = d