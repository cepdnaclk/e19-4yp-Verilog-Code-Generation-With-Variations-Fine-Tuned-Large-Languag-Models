module dff(do,di,clk); // Behavioral D Flip-Flop
output do;
input di,clk;
reg do; // Output must be reg for procedural