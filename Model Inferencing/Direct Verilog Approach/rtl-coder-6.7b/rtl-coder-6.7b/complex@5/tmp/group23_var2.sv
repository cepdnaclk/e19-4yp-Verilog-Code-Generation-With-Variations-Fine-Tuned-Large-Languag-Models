module shift_reg_v1( input [3:0] d_in, input clk, sr, sl, ld, rst,
input [1:0] s_cnt, output reg [3:0] q);
reg [3:0] int_q;
wire [3:1] ins = {1'b0, 2'b10, 1'b0}
initial begin
if( ins == rr.ir ) begin
    // int_q = 1;
    memory[0] = 1;
end
end
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