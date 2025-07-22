module d_ff (input d, clk, s, r, output reg q, q_b );
parameter s_in=1;
always @( s ) begin : force_a_1
if ( s )
begin
end else begin
deassign q;
deassign q_b;
end
if ( s inside {s_in} )
begin
end else begin
$error("Error: s not inside s_in");
end
end
always @( r ) begin : force_a_0
if( r )
begin
end else begin
deassign q;
deassign q_b;
end
end
always @( posedge clk ) begin : clocked
end
endmodule