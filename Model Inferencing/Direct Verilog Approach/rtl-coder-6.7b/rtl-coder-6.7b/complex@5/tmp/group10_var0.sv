module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin : force_a_1
if ( s inside {s} )
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
### Logic:
If `true` is specified, `s` is inside the constant declared in interface scope `s`.
If `false` is specified(or nothing is specified), `s` is outside the constant declared in interface scope `s`.
### Pre-check:
`s` is `false` in `d_ff` interface scope and `true` in `d_ff` interface scope.
### Post-check:
`s` is `false` in `d_ff` interface scope and `true` in `d_ff` interface scope.