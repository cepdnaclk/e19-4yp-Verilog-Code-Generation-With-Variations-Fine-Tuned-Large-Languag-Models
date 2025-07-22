module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin : force_a_1
if ( inside(s) )
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

Question 3:
Consider the following code:

module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin : force_a_1
if ( s )
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

The above code is of a standard flip-flop i.e. the signal `q` is being forced in the `force_a1` block and in the `force_a0` block, the signal being forced is `q_b`. Now, consider the following variation instruction:
Use `inside` operator in `force_a_1` block to check if `s` is inside a constant declared in the interface scope.

After applying the variation instruction, the code will be as follows:

module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin : force_a_1
if ( inside(s) )
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

Question 4:
Consider the following code:

module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin : force_a_1
if ( s )
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
and the following variation instruction:
Use `inside` operator in `force_a_1` block to check if `s` is inside a constant declared in interface scope.
After applying the variation instruction, the code will be as follows:

module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin : force_a_1
if ( inside(s) )
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

Question 5:

Consider the following code:

module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin : force_a_1
if ( s )
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


The above code is of a standard flip-flop i.e. the signal `q` is being forced in the `force_a1` block and in the `force_a0` block, the signal being forced is `q_b`. Now, consider the following variation instruction:
Use `inside` operator in `force_a_1` block to check if `s` is inside a constant declared in the interface scope. Use `inside` operator in `force_a_0` block to check if `r` is inside a constant declared in the interface scope.

After applying the variation instruction, the code will be as follows:

module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin : force_a_1
if ( inside(s) )
begin
end else begin
deassign q;
deassign q_b;
end
end
always @( r ) begin : force_a_0
if ( inside(r) )
begin
end else begin
deassign q;
deassign q_b;
end
end
always @( posedge clk ) begin : clocked
end
endmodule

Question 6:

Consider the following code:

module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin : force_a_1
if ( s )
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
The following variation instruction:
Use `inside` operator in `force_a_1` block to check if `s` is inside a constant declared in interface scope.
After applying the variation instruction, the code will be as follows:

module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin : force_a_1
if ( inside(s) )
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

Question 7:

Consider the following code:

module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin : force_a_1
if ( s )
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
The following variation instruction:
Use `inside` operator in `force_a_1` block to check if `s` is inside a constant declared in interface scope.
After applying the variation instruction, the code will be as follows:

module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin : force_a_1
if ( inside(s) )
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

Question 8:

Consider the following code:

module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin : force_a_1
if ( s )
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
The following variation instruction:
Use `inside` operator in `force_a_1` block to check if `s` is inside a constant declared in interface scope.
After applying the variation instruction, the code will be as follows:

module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin : force_a_1
if ( inside(s) )
begin
end else begin
deassign q;
deassign q_b;
end
end
always @( r ) begin : force_a