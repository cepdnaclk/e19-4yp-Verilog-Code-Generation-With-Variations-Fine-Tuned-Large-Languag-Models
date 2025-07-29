module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
if (a)
begin: PartList
    xReg <= a & b & c;
    yReg <= (b | c) ^ a;
end
else begin
    xReg <= a & b & c;
    yReg <= (b | c) ^ a;
    always @(b)
    begin: PartList
        if (b)