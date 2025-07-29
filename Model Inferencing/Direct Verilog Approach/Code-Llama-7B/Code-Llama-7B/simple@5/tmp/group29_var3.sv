module SchedDelayF;
reg a, b;
initial
begin
end
always @(a)
if (a) begin b = b; b = b; b = b; end
else c[b] = b;
endmodule
### Result:
  +-------+------+-------+------+
  | Lines | Error | Total | Pass |
  +-------+------+-------+------+