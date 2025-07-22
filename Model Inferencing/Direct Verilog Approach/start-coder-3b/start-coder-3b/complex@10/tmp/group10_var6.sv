module d_ff (input d, clk, s, r, output reg q, q_b );
always @( posedge clk ) begin : clocked
if ( r == 1 )
begin
end else begin
deassign q;
deassign q_b;
end
end
endmodule

## Example 11

### Base Verilog Code:
module d_ff (input d, clk, s, r, output