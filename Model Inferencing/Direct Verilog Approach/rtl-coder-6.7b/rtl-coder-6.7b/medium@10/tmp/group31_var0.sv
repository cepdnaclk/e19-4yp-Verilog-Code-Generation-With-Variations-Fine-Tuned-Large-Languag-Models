module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
wire [7:0] xPart, yPart;
reg [7:0] xIn, xOut, yIn, yOut;
assign xPart = xReg;
assign yPart = yReg;

always @(a, b)
begin: PartList
    xReg <= a & b & c;
    yReg <= (b | c) ^ a;
end

always @(a)
begin: PartInOut
    if (a)
    begin: PartIn
        if (b)
        begin: PartInFirst
            xIn[2] = a;
            xIn[1:0] = {2{a}};
            xIn[2:1] = {2{a}};
            xIn[3:0] = {2{a}};
            xIn[4:0] = {2{a}};
            xIn[5:0] = {2{a}};
            xIn[6:0] = {2{a}};
            xIn[7:0] = {2{a}};
        end
        else if (c)
        begin: PartInSecond
            yIn[2] = a;
            yIn[1:0] = {2{a}};
            yIn[2:1] = {2{a}};
            yIn[3:0] = {2{a}};
            yIn[4:0] = {2{a}};
            yIn[5:0] = {2{a}};
            yIn[6:0] = {2{a}};
            yIn[7:0] = {2{a}};
        end
        else
        begin: PartInThird
            xIn[1] = a;
            xIn[2:0] = {2{a}};
            xIn[3:0] = {2{a}};
            xIn[4:0] = {2{a}};
            xIn[5:0] = {2{a}};
            xIn[6:0]