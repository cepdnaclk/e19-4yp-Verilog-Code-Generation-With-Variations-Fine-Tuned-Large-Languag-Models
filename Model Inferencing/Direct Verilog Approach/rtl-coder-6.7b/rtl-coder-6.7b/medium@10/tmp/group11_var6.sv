module aoi2(g,a,b,c,d);
output g;
input a,b,c,d;
wire e,f,g1; // Intermediate signals
// Dataflow assignments for AND, OR, and NOT operations
assign e = a && b;
assign f = c && d;
assign g1 = e || f;
assign g = ~g1; // Final AOI output
// Parameters used to create the number of AOI2 cells
parameter X = 2;
parameter Y = 3;
parameter A1 = 0;
parameter B1 = 0;
parameter C1 = 0;
parameter D1 = 0;
// Initial block for initializing array of AOI2 cells
initial
begin
for(int i = A1; i<(A1+X); i=i+1)
for(int j = B1; j<(B1+Y); j=j+1)
aoi2_inst[j-B1][i-A1] = new("aoi2_inst[$d][$d]", 0, @aoi2(g,a,b,c,d), i, j);
end
endmodule