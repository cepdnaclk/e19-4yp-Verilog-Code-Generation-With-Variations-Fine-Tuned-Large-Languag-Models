module EventCtlPart (output xPart, yPart, input a, b, c);
reg xPart, yPart;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b, c)
begin: PartList
    xReg <= a & b & c;
    yPart <= (b | c) ^ a;
end
endmodule
### Testbench Code:
module EventCtlPartTB;
reg a, b, c;
wire xPart, yPart;
assign a = 1;
assign b = 1;
assign c = 1;
EventCtlPart uut (xPart, yPart, a, b, c);
initial begin
 #100;
 a = 0;
 #100;
 a = 1;
 #300;
 a = 0;
 #300;
 a = 1;
 #300;
 a = 0;
 #300;
 a = 1;
 #300;
 a = 0;
 #300;
 a = 1;
 #300;
 a = 0;
 #300;
 a = 1;
 #300;
 a = 0;
 #300;
 a = 1;
 #300;
 a = 0;
 #300;
 a = 1;
 #3