module dff(do,di,clk); // Behavioral D Flip-Flop
output do;
input di,clk;
reg do; // Output must be reg for procedural assignment
integer i; // Counts number of clock edges
initial
do=1'b0; // Initialize output
// Assign input 'di' to output 'do' on negative clock edge
always@(negedge clk) begin
i = i + 1;
case(i)
1: begin // First clock edge, clear output
do=1'b0;
end
2: begin // Second clock edge, set output
if (do)
do=1'b0;
else
do=di;
end
3: begin // Third clock edge, set output
if (do)
do=1'b0;
else
do=di;
end
4: begin // Fourth clock edge, do nothing
end
default: // Any remaining clock edges, do nothing
endcase
end
endmodule