module EventCtlPartArray (output xPart, yPart, input a, b, c);
reg [0:99] xReg, yReg;
assign xPart = xReg[0];
assign yPart = yReg[0];
always @(a, b)
begin: PartList
    xReg <= a & b & c;
    if (a | b)
        if (b & c)
            begin: with
                xReg[1] <= a | b | c;
            end
        else
            yReg[0] <= (b | c) ^ a;
        else
            xReg[2] <= a & b & c;
            xReg[3] <= a | b | c;
            xReg[4] <= (a < 4'd2)? 1'b0 : 1'b1;
            xReg[5] <= (a & (a >> 2))? 1'b0 : 1'b1;
            xReg[6] <= (a &!a)? 1'b0 : 1'b1;
            xReg[7] <= (a & (a & 1'b1))? 1'b0 : 1'b1;
            xReg[8] <= (a & (a | 1'b0))? 1'b0 : 1'b1;
            xReg[9] <= (a &!a)? 1'b0 : 1'b1;
            xReg[10] <= (a == 1'b1)? 1'b0 : 1'b1;
            xReg[11] <= (a == 1'b0)? 1'b0 : 1'b1;
            xReg[12] <= (a < 1'b1)? 1'b0 : 1