module shift_reg( input [3:0] d_in, input clk, sr, sl, ld,
input [1:0] s_cnt, output reg [3:0] q);
reg [3:0] int_q;
reg [3:0][1:0] int_sl;
reg [3:0][1:0] int_sr;
reg [3:0][1:0] int_ld;
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
if (int_sl)
int_q <= int_q >> 1;
else if (int_sr)
int_q <= int_q << 1;
else if (int_ld)
int_q <= d_in;
else if (int_q <= 8'h8)
int_q <= int_q + d_in;
end
endmodule

### Results:

As shown below, the shift registers are still showing the same behavior.

### Final Code:

module shift_reg( input [3:0] d_in, input clk, sr, sl, ld,
input [1:0] s_cnt, output reg [3:0] q);
reg [3:0] int_q;
reg [3:0][1:0] int_sl;
reg [3:0][1:0] int_sr;
reg [3:0][1:0] int_ld;
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
if (int_sl)
int_q[3] <= int_q[2], int_q[2] <= int_q[1], int_q[1] <= int_q[0], int_q[0] = 0;
else if (int_sr)
int_q[0] <= int_q[1], int_q[1] <= int_q[2], int_q[2] <= int_q[3], int_q[3] = 0;
else if (int_ld)
int_q <= d_in;
else
int_q <= int_q + d_in;
end
endmodule

### Results:

As seen above, the shift registers are now working as expected. The shift registers are now able to shift in and out the data being manipulated by the processor and can be used to control the behavior of the rest of the logic.

#### 

Founder & CEO, Mega-Stream Technologies (1,335 jobs)

Hall of Fame

Mega-Stream Technologies is the leader in the design of high-performance and ultra-low-power ASICs for IoT, automotive, and high-end gaming.

View all Mega-Stream Technologies profile