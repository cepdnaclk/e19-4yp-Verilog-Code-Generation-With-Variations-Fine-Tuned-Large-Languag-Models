module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b)
begin: PartList
    if (c) begin
        xReg <= a & b & c;
        yReg <= (b | c) ^ a;
    end
end
endmodule
### End of File