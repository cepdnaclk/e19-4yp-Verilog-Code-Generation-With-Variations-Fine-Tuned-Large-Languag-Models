```
module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin : force_a_1
if ( s inside {`CONST_IN_INTERFACE} )
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
### Result Output:
Below is the result output of the verification tool (UVM).
![Result output of verification tool](https://github.com/alanlai300/UVM_Validation/blob/master/images/result_output.png)