module dff(do,di,clk); // Behavioral D Flip-Flop
output do;
input di,clk;
reg do; // Output must be reg for procedural assignment
initial
do=1'b0; // Initialize output
// Assign input 'di' to output 'do' on negative clock edge
always@(negedge clk) begin
case(clk)
2'd0: do=di; // Use non-blocking <= for sequential logic
2'd1: do=1'b1; // Use non-blocking <= for sequential logic
endcase
endmodule