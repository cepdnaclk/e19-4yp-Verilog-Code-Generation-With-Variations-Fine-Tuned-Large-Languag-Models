### Base Verilog Code:
module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = xReg