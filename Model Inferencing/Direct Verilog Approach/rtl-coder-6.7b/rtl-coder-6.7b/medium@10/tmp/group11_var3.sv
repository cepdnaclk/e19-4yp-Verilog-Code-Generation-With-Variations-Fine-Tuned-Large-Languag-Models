module aoi2(g,a,b,c,d);
output g;
input a,b,c,d;
wire e,f,g1; // Intermediate signals
// Dataflow assignments for AND, OR, and NOT operations
assign e = a && b;
assign f = c && d;
assign g1 = e || f;
assign g = ~g1; // Final AOI output
initial
begin
  g = e[0] + f[1];
end
endmodule
### Testbench Code:
module tb_aoi2;
reg a,b,c,d;
wire g;
// DUT instantiation
aoi2 uut (.g(g),.a(a),.b(b),.c(c),.d(d));
// Stimulus generation
initial
begin
  a = 0; b = 0; c = 0; d = 0; #10;
  a = 0; b = 0; c = 0; d = 1; #10;
  a = 0; b = 0; c = 1; d = 0; #10;
  a = 0; b = 0; c = 1; d = 1; #10;
  a = 0; b = 1; c = 0; d = 0; #10;
  a = 0; b = 1; c = 0; d = 1; #10;
  a = 0; b = 1; c = 1; d = 0; #10;
  a = 0; b = 1; c = 1; d = 1; #10;
  a = 1; b = 0; c = 0; d = 0; #10;
  a = 1; b = 0; c = 0; d = 1; #10;
  a = 1; b = 0; c = 1; d = 0; #10;
  a = 1; b = 0; c = 1; d = 1; #10;
  a = 1; b = 1; c = 0; d = 0; #10;
  a = 1; b = 1; c = 0; d = 1; #10;
  a = 1; b = 1; c =