module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b)
begin: PartList
    xReg <= a & b & c;
    yReg <= (b | c) ^ a;
    if ((a == 1 || a == 2 || a == 4 || a == 8 || a == 16 || a == 10) &&
        (b == 1 || b == 2 || b == 3 || b == 4 || b == 5 || b == 6) &&
        (c == 1 || c == 2 || c == 3 || c == 4 || c == 5))
    begin
        aReg <= #5 (a & b & c)? 1 : 0;
        bReg <= #5 ((b | c) ^ a)? 1 : 0;
    end
    else 
    begin
        xReg <= #10 0;
        yReg <= #10 0;
    end
end
endmodule