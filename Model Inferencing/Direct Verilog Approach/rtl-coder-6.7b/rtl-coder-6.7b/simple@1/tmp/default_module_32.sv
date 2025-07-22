# Clock_Prog.v
# Inputs:
# clk - clock input
# Outputs:
# clk_g - registered clock
module Clock_Prog (
input clk,
output clk_g);
# Variables:
reg clk_g;
# Logic:
always @ (posedge clk)
clk_g <= clk;
endmodule
### Variation Code:
# t_Clock_Prog.v
module t_Clock_Prog ();
# Variables:
# clock - clock input
# clk - clock input
# clk_g - registered clock
# Resetn - reset
# Resetn_enum - enum reset
reg Resetn_enum;
reg Resetn;
# Driver:
initial
begin
Resetn_enum = foo;
Resetn = 1'b0;
$monitor($time,, "clock = %b, Resetn = %b, Resetn_enum = %s, clk_g = %b", clk, Resetn, Resetn_enum, clk_g);
end
# Clock Generator:
initial
begin
clk = 1'b0;
forever #10 clk = ~clk;
end
# Instantiate:
Clock_Prog M1 (clk, Resetn, Resetn_enum, clk_g);
# Stop simulation after 100 time units
initial #100 $finish;
endmodule
### Testbench Code:
# Clock_Prog.v
module Clock_Prog (
input clk,
input Resetn,
input enum Resetn_enum,
output clk_g);
# Variables:
reg clk_g;
# Logic:
always @ (posedge clk or negedge Resetn)
begin
if (Resetn == 0)
if (Resetn_enum!= foo)
clk_g <= 1'b0;
else
clk_g <= 1'b1;
else
if (Resetn_enum == foo)
clk_g <= 1'b1;
else
clk_g <= 1'b0;
end
endmodule
### Categories:
# 3.2.6
### Description:
# Tested the code for all resetn cases