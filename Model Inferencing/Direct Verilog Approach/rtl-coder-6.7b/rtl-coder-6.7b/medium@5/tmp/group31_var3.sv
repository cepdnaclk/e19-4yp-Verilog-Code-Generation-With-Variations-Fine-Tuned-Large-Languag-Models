module E1Part3(output xPart, yPart, input a, b, c);
reg xReg, yReg;
reg [2:0] test;
assign test = a? {2'b00 : 2'b01} : {2'b01 : 2'b00};
assign xPart = xReg;
assign yPart = yReg;
if(a & b & c)
    xPart <= xReg;
else if((a & b & c) | ~(b