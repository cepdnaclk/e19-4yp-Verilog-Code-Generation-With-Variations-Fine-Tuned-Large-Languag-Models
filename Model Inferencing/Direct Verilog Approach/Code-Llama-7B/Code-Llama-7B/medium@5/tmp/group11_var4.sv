module aoi2b(g,a,b,c,d);
output g;
input a,b,c,d;
wire e,f,g1; // Intermediate signals
// Dataflow assignments for AND, OR, and NOT operations
assign e = a && b;
assign f = c && d;
assign g1 = e || f;
assign g = ~g1; // Final AOI output

initial begin
  $display("g[%0d] = %0d", g(1), g1);
end
endmodule
### Expected Result:
vlog -quiet aoi2b.v