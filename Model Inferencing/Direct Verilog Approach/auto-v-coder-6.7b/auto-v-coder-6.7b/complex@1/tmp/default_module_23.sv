```verilog
module shift_reg( input [3:0] d_in, input clk, sr, sl, ld, rst,
input [1:0] s_cnt, output reg [3:0] q);
reg [3:0] int_q;
always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
if( ld )
int_q = d_in;
else if( sr )
int_q = q >> s_cnt;
else if( sl )
int_q = q << s_cnt;
else int_q = q;
end
always @( posedge clk ) begin: register
if (rst) q <= 0;
else q <= int_q;
end

genvar i;
generate
for (i=0; i<4; i++) begin : inside_check
always @(*) begin
if(int_q[i] == 1'b1) begin
$display("inside register");
end
end
end
endgenerate
endmodule
```
This will print to the standard output the message "inside register" whenever there is a one in the internal register `int_q`. The generate block allows the checking to be performed for each bit of the register `int_q`. Note that this will be printed only when the internal register `int_q` is updated. If the logic does not change the `int_q` value, then this message will not be printed.

Remember, this will print multiple messages in case the `int_q` has multiple ones (as it's a parallel operation). To print the message only once for a single change, you may need to add an additional logic to keep track of the last state and print the message only when the state changes.