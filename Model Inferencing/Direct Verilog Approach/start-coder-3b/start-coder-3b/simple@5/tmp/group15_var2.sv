module alu_tb;
reg [32:0] a,b,c;
wire [32:0] r;
alu_inst alu (a,b,c,r);
always #1 c = a + b;
always
#1 a = $random; b = $random;
#1 $random
endmodule