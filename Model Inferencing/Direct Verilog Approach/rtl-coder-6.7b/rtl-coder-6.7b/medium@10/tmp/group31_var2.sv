module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b)
begin: PartList
    xReg <= a & b & c;
    yReg <= (b | c) ^ a;
end
    if (a) begin
        if (b) begin
            if (c) begin
                xReg = 1'b1;
            end
        end
    end
end
endmodule