module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = a?yReg;
assign yPart = yReg;
always @(a, b)
begin: PartList
    xReg <= a & b & c;
    yReg <= (b | c) ^ a;
end
endmodule
### Base Verilog