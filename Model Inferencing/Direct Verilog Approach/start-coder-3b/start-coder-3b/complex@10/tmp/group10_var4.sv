module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin
if ( s inside {1'b1,1'b0} ) //constant declared in a block
begin
end else begin
deassign q;
deassign q_b;
end
end
always @( r ) begin
if( r )
begin
end else begin
deassign q;
deassign q_b;
end
end
always @( posedge clk ) begin
force s = 1'b0; //constant declared in a block
end
endmodule
### Output:

As the `force` block is inside the `always` block, the constant is valid only inside the `force` block.

#### Other Operator Examples:

• To check if the constant is present in an `always` block, use `inside` operator inside a `force` block.
• To check if the constant is present inside an `always` block, use `inside` operator inside a `force` block.

Published on 19-Nov-2020 13:20:37