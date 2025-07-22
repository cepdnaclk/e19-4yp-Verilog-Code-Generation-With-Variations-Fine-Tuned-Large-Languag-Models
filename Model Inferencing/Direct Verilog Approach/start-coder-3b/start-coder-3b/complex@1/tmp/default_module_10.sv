module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin : force_a_1
if( s )
begin
end else begin
deassign q;
deassign q_b;
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