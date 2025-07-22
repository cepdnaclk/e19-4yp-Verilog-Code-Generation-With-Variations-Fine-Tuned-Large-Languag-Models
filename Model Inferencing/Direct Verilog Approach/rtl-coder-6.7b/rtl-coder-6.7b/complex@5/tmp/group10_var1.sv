```
module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin : force_a_1
if ( `inside(s, const_in_interface_scope) ) 
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
```
### Output:
```
verilog_model-verilog_model-
module d_ff (
input d, 
input clk, 
input s, 
input r, 
output reg q, 
output reg q_b 
);
always @( s ) begin : force_a_1
if( `inside(s, const_in_interface_scope) ) begin
end else begin
deassign q;
deassign q_b;
end
end
always @( r ) begin : force_a_0
if( r ) begin
end else begin
deassign q;
deassign q_b;
end
end
always @( posedge clk ) begin : clocked
end
endmodule
```