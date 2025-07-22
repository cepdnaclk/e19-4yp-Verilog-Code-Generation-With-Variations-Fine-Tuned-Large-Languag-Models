module dff(do,di,clk); // Behavioral D Flip-Flop
output do;
input di,clk;
reg do; // Output must be reg for procedural assignment
integer i;
initial
do=1'b0; // Initialize output
// Assign input 'di' to output 'do' on negative clock edge
always@(negedge clk)
case(i) inside
[0:4,7:11] : do <= 1'b1;
default: do <= 1'b0;
endcase
endmodule