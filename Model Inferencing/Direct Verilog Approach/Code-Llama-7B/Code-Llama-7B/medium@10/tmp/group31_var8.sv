module EventCtlPart #(parameter N = 15) (output xPart, yPart, input a, b, c);
reg [N:0] PartList[N:0];
reg [N:0] xReg[N:0];
reg [N:0] yReg[N:0];
assign xPart = xReg;
assign yPart = yReg;
always @(a, b)
begin: PartList
    for (int i = 0; i < N; i = i+1)
    begin: loop
        if (i >= 7 && i <= 13)
        begin: PartList
            xReg[i] <= a & b & c;
            yReg[i] <= (b | c) ^ a;
        end
        else
        begin: PartList
            if (i >= 0 && i <= 6)
            begin: PartList
                xReg[i] <= a & b & c;
                yReg[i] <= (b | c) ^ a;
            end
        end
    end
end
endmodule
### Original Code:
module EventCtlPart (output xPart, yPart,