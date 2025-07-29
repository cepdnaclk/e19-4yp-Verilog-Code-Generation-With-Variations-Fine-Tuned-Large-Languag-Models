module example7_5(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
always @(posedge Clock)
begin
  integer i;
  case(x1)
    1'b0: i = 0;
    1'b1: i = 1;
  endcase