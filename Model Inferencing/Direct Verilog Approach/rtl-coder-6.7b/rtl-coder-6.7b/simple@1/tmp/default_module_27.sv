struct {reg a; wire ca,s} in;
always @(posedge clk)
begin : s
  s <= a;
  ca <= #2 s & #2 a;
end : s