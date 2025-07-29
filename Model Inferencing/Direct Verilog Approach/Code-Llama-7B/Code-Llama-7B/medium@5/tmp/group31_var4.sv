module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b)
begin: PartList
    xReg <= a & b & c;
    if (b[1:0] == 2'b10)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b11)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b10)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b11)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b10)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b11)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b10)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b01)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b11)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b10)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b01)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b11)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b00)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b11)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b10)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b01)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b11)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b10)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b01)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b11)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b10)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b01)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b11)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b10)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b01)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b11)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b10)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b01)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b11)
        yReg <= (b | c) ^ a;
    else if (b[1:0] == 2'b00)
        yReg <= (b | c)