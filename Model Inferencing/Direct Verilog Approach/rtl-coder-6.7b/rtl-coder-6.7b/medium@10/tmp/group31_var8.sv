module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b)
begin: PartList
    if (b == 1)
    begin
        if (c == 1)
        begin
            xReg <= a & b & c;
            yReg <= (b | c) ^ a;
        end
    end
    else if (b == 0)
    begin
        if (c == 1)
        begin
            xReg <= a & b & c;
            yReg <= (b | c) ^ a;
        end
        else if (c == 0)
        begin
            xReg <= a & b & c;
            yReg <= (b | c) ^ a;
        end
    end
end
endmodule
### Description:
The nested if structure allows for variable range selection of a 3D array slice.
### Verilog Comparison:
### Verilog 2001
### 5.22.1 2D and 3D array slices
Slice indices are separated with the [:] symbol. 
### Verilog 2005
### 5.22.1 2D and 3D array slices
Slice indices are separated with the [:] symbol.