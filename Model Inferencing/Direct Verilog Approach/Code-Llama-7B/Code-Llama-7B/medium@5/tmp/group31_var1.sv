module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b)
begin: PartList
if( a < 3 && b < 5)
    xReg <= a & b & c;
else
    xReg <= 1;
if( b < 3 && c < 5)
    yReg <= (b | c) ^ a;
else
    yReg <= 1;
end
endmodule
### Simulation:
### Simulation Time: 42
### Simulation Length: 0.25
### Simulation Frequency: 4000
### Wire Delay: 0.03
### Wire Signal: (WireName,WireCycle,Delay)
### Slice Length: 1
### Slice Delay: 0.03
### Slice Signal: (SliceName,Low,High,Delay)
### Slice Range: (SliceName,Min,Max,