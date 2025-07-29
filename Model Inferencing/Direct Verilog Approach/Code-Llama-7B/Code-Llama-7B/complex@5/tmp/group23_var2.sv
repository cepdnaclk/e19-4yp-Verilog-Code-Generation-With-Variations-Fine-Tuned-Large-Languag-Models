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

parameter INST_MUP= 2'b01;
parameter INST_LD= 2'b01;
parameter INST_SL= 2'b00;
parameter INST_SR= 2'b01;
parameter INST_RST= 2'b00;

parameter [2:0] cnst [3:0] =
    { INST_SL, INST_SL, INST_SL, INST_SL },
    { INST_RST, INST_RST, INST_RST, INST_RST },
    { INST_SR, INST_SR, INST_SR, INST_SR },
    { INST_LD, INST_LD, INST_LD, INST_LD };

reg [2:0] ir;
reg op;
reg [3:0] dout;
wire [3:0] d_in_wire;
assign d_in_wire = d_in;
always @(posedge clk) begin
    if (rst) ir <= 0;
    else ir <= ir + 1;
end
generate
    for(genvar i = 0; i < 4; i = i + 1) begin: check_op
    if( cnst[i] == ir ) op <= 1;
    else op <= 0;
    case(cnst[i])
    3'b011 : reg_mux_0_5 (.s(op),.d_in(d_in_wire),.d_out(dout));
    3'b100 : clk_div_4x (.clk(clk),.s_cnt(s_cnt),.op(op),.d_out(dout));
    3'b101 : shift_reg (.d_in(dout),.clk(clk),.sr(op),.sl(op),.ld(op),.rst(op),.s_cnt(s_cnt),.q(dout));
    3'b110 : reg_mux_1_4 (.s(op),.d_in(d_in_wire),.d_out(dout));
    3'b111 : clk_div_2x (.clk(clk),.s_cnt(s_cnt),.op(op),.d_out(dout));
    endcase
    end
endgenerate
endmodule
### Modified Verilog Code:
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

parameter INST_MUP= 2'b10;
parameter INST_LD= 2'b01;
parameter INST_SL= 2'b00;
parameter INST_SR= 2'b10;
parameter INST_RST= 2'b00;

parameter [2:0] cnst