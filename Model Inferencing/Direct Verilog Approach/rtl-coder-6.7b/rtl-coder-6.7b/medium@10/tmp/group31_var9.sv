module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b)
begin: PartList
    xReg <= a & b & c;
    yReg <= (b | c) ^ a;
end

always @(a, b)
if (b & c)
	begin
	if (a == 1)
		begin
		xReg = xReg;
		yReg = yReg;
		end
	else
		begin
		xReg = 0;
		yReg = 0;
		end
	end
else
	begin
	xReg = 0;
	yReg = 0;
	end
endmodule

### Expected Verilog Code:
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