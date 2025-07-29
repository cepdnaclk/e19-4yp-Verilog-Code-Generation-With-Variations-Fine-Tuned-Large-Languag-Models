module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg[0:1], yReg[0:1];
assign xPart = xReg[1];
assign yPart = yReg[1];
integer i;
always @(