module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin : force_a_1
if ( s!= 1'b1 )
begin
end else begin
deassign q;
deassign q_b