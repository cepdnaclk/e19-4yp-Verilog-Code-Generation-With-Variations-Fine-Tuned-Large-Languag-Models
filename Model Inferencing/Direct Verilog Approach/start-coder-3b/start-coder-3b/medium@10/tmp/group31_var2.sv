module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b)
begin: PartList
    xReg <= a & b & c;
    yReg <= (b | c) ^ a;
end
endmodule

module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b)
begin: PartList
    xReg <= a & b & c;
    yReg <= (b | c) ^ a;
    if (a) begin: PartList
        xReg <= a & b & c;
        yReg <= (b | c) ^ a;
    end
end
endmodule

### Regenerate Code:

The above rearrangements are applied to all the modules with a nested if in the always block of the RTL.