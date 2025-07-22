module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b)
begin: PartList
  xReg <= a & b & c;
  yReg <= (b | c) ^ a;

  if (yPart) begin
    if (yReg) begin
      a <= xReg ^ yReg;
      c <= xReg ^ a;
      b <= xReg ^ c;
    end
  end
end
endmodule
### Testing Code:
module Test;
reg xPart, yPart, a, b, c;
EventCtlPart Parts (xPart, yPart, a, b, c);

initial begin
  a = 0; b = 0; c = 0;
  #1;
  a = 1; b = 1; c = 1;
  #1;
  a = 1; b = 1; c = 0;
  #1;
  a = 1; b = 0; c = 0;
  #1;
  $finish;
end
endmodule