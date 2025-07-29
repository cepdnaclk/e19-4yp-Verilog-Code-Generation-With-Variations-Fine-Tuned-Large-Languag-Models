module aoi2(g,a,b,c,d);
output g;
input a,b,c,d;
wire e,f,g1; // Intermediate signals
// Dataflow assignments for AND, OR, and NOT operations
initial begin
e = a && b;
f = c && d;
g1 = e || f;
g = ~g1; // Final AOI output
end
endmodule
### Implemented Design:
![Verilog code