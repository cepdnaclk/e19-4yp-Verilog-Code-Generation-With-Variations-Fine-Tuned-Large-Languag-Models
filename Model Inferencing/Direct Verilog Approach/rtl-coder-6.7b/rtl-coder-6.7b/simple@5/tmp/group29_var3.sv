module SchedDelayA;
// Regression test for #334
// Regression test for #333
reg a, b;
initial
begin
$display("Test");
end
always @(b) a = b;
always @(a) b <= a;
endmodule