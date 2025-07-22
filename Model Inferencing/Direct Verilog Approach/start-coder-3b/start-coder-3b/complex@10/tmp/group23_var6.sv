module shift_reg( input [3:0] d_in, input clk, sr, sl, ld,
input [1:0] s_cnt, output reg [3:0] q);
reg [3:0] int_q;
localparam [2:0] SRL_CNT = 2'b000;
localparam [2:0] SL_CNT = 2'b001;
localparam [2:0] SR_CNT = 2'b010;
localparam [2:0] FULL_CNT = 2'b100;
generates
generate
if (rr.ir == SRL_CNT) begin: shift_reg_srl_cnt
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
end
if (rr.ir == SL_CNT) begin: shift_reg_sl_cnt
always @(posedge clk)
int_q = q << s_cnt;
end
end
if (rr.ir == SR_CNT) begin: shift_reg_sr_cnt
always @(posedge clk)
int_q = q >> s_cnt;
end
end
if (rr.ir == FULL_CNT) begin: shift_reg_full_cnt
always @(posedge clk) begin
if (rst) q <= 0;
else q <= int_q;
end
end
end
endgenerate
endmodule

## How to use this?

Use the following steps to set up the Verilator Simulation:

• Compile the Verilator generator using ‘make’.
• Run the simulator using the “./obj_dir/Vshift_reg -vpd Vshift_reg.vpd”.

## Output:

A waveform trace of the testbench is given below, which can be analyzed and profiled:

## Explanation:

### Base Verilog Code:

module shift_reg( input [3:0] d_in, input clk, sr, sl, ld,
input [1:0] s_cnt, output reg [3:0] q);
reg [3:0] int_q;
always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
if( ld )
int_q = d_in;
else if( sr )
int_q = q >> s_cnt;
else if( sl )
int_q = q << s_cnt;
else int_q =