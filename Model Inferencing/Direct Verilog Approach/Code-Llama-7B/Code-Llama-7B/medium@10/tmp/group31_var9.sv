module EventCtlPart (output xPart, yPart, input a, b, c);
reg [1:0] xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b)
begin: PartList
    xReg <= a & b & c;
    yReg <= (b | c) ^ a;
    if(0)
    begin
        if(