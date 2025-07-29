module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b, c)
begin: PartList
    if(c)
    begin: Part
        if (a > 3'b000 & a <= 3'b111) begin: aRange
            xReg <= a & b;
            yReg <= (b | c) ^ a;
        end
        else if (a > 3'b111 & a <= 3'b222) begin: aRange
            xReg <= a & b; 
            yReg <= (b | c) ^ a;
        end
        else if (a > 3'b222 & a <= 3'b333) begin: aRange
            xReg <= a & b; 
            yReg <= (b | c) ^ a;
        end
        else begin: aRange
            xReg <= a & b; 
            yReg <= (b | c) ^ a;
        end
    end
    else begin: Part
        if (a > 3'b000 & a <= 3'b111) begin: aRange
            xReg <= a & b;
            yReg <= (b | c) ^ a;
        end
        else if (a > 3'b111 & a <= 3'b222) begin: aRange
            xReg <= a & b; 
            yReg <= (b | c) ^ a;
        end
        else if (a > 3'b222 & a <= 3'b333) begin: aRange
            xReg <= a & b; 
            yReg <= (b | c) ^ a;
        end