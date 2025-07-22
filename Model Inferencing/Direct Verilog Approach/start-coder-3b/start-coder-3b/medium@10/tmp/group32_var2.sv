module dff(do,di,clk); // Behavioral D Flip-Flop
output do;
input di,clk;
reg do;
initial
do=1'b0; // Initialize output
// Assign input 'di' to output 'do' on negative clock edge
always@(negedge clk)
begin
case (di)
1'b0: do=1'b0;
1'b1: do=1'b1;
endcase
endmodule