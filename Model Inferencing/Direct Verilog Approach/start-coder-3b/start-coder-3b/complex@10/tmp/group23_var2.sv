`module shift_reg( input [3:0] d_in, input clk, sr, sl, ld, input [1:0] s_cnt, output reg [3:0] q); reg [3:0] int_q; always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational if( ld ) int_q = d_in; else if( sr ) int_q = q >> s_cnt; else if( sl ) int_q = q << s_cnt; else int_q = q; end end

reg [3:0] mux_opt [0:1];

always @( posedge clk ) begin: register
if (rst) mux_opt <= 0;
else end
if (sl)
mux_opt[1] <= 1'b1;
else if( sr )
mux_opt[0] <= 1'b1;
else
mux_opt[1] <= 1'b0;
mux_opt[0] <= 1'b0;
end

always @( posedge clk ) begin: register
if (rst) q <= 0;
else if (ld)
q <= d_in;
else if (mux_opt[0] == 1'b1)
q <= int_q >> s_cnt;
else if (mux_opt[1] == 1'b1)
q <= int_q << s_