reg a1;
reg a2;
reg b1;
always @ (posedge clk) begin
if (b1)
a1 = a2; // b1 = 1 -> a1 = a2
end
module tst_wand1; //testbench
reg a1;
reg a2;
reg b1;
wand1 ww(a1,a2,b1);
initial
begin
a1 =0; a2 = 0; b1 = 0; // a1 = a2 = b1 =