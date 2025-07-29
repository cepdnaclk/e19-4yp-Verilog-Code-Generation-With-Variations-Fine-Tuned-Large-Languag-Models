module gade(a,a1,b,c,b1,c1);
input b,c,b1,c1;
output a,a1;
// Instantiate OR gate with inertial delay 3
or #3 gg1(a1,c1,b1);
// Instantiate AND gate with rise=2, fall=1 inertial delay
and #(2,1) gg2(a,c,b);
endmodule
module mkT(Empty);
Reg#(int) rg1 <- mkReg(0);
Reg#(int) rg2 <- mkReg(0);
Reg#(int) rg3 <- mkReg(0);
Reg#(int) rg4 <- mkReg(0);
Reg#(int) rg5 <- mkReg(0);
Reg#(int) rg6 <- mkReg(0);
Reg#(int) rg7 <- mkReg(0);
Reg#(int) rg8 <- mkReg(0);
Reg#(int) rg9 <- mkReg(0);
Reg#(int) rg10 <- mkReg(0);
Reg#(int) rg11 <- mkReg(0);
Reg#(int) rg12 <- mkReg(0);
Reg#(int) rg13 <- mkReg(0);
Reg#(int) rg14 <- mkReg(0);
Reg#(int) rg15 <- mkReg(0);
Reg#(int) rg16 <- mkReg(0);
Reg#(int) rg17 <- mkReg(0);
Reg#(int) rg18 <- mkReg(0);
Reg#(int) rg19 <- mkReg(0);
Reg#(int) rg20 <- mkReg(0);
Reg#(int) rg21 <- mkReg(0);
Reg#(int) rg22 <- mkReg(0);
Reg#(int) rg23 <- mkReg(0);
Reg#(int) rg24 <- mkReg(0);
Reg#(int) rg25 <- mkReg(0);
Reg#(int) rg26 <- mkReg(0);
Reg#(int) rg27 <- mkReg(0);
Reg#