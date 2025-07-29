module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
always @(a, b)
begin: PartList
    xReg <= a & b & c;
    yReg <= (b | c) ^ a;
    if (a[3:1] == 2'b01)
    begin: 3DArraySlice
        if (a[4] == 1'b0)
        begin: RangeInclusion
            xReg <= a & b & c;
        end
        else
        begin: NotRangeInclusion
            yReg <= (b | c) ^ a;
        end
    end: 3DArraySlice