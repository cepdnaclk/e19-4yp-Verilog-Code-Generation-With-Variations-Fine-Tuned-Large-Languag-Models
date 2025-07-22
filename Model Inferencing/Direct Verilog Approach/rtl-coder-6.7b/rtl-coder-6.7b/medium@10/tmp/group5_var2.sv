module test_k;
wire q, clock, j, k, preset, clear;
logic[4:0][10:0] testData;
reg j, k;
jkEdgeFF jk(q, clock, j, k, preset, clear);
initial
begin
  testData[2][3] <= 1;
  reset_ff;
  j = 1;
  k = 0;
end
m555 timer(clock);
endmodule