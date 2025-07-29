module shift_reg( input [3:0] d_in, input clk, sr, sl, ld, rst,
input [1:0] s_cnt, output reg [3:0] q);
reg [3:0] int_q;
localparam reg [3:0] ins = {(ins_reg & 32'h20000000)? 1'b1 : (ins_reg& 32'h10000000)? 1'b1 : 1'b0, (ins_reg & 32'h20000000)? 1'b1 : (ins_reg& 32'h08000000)? 1'b1 : 1'b0, (ins_reg & 32'h20000000)? 1'b1 : (ins_reg& 32'h04000000)? 1'b1 : 1'b0, (ins_reg & 32'h20000000)? 1'b1 : (ins_reg& 32'h02000000)? 1'b1 : 1'b0};
always @( d_in, int_q, s_cnt, sr, sl, ld, ins) begin: combinational
if( ld )
int_q = d_in;
else if( ins [0] )
int_q = int_q << s_cnt;
else if( ins [1] )
int_q = int_q >>> s_cnt;
else if( ins [2] )
int_q = int_q >> s_cnt;
else if( ins [3] )
int_q = int_q << s_cnt;
else int_q = int_q;
end
always @( posedge clk ) begin: register
if (rst) int_q <= 0;
else q <= int_q;
end
endmodule