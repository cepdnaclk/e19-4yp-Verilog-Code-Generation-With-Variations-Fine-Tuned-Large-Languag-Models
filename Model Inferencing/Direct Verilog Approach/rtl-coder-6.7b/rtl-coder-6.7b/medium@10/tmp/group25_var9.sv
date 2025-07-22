module example7_5(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
always @(posedge Clock)
begin
    case ({x1, x2})
    2'b00 : f = 1'b0;
    2'b01 : f = 1'b1;
    2'b10 : f = 1'b1;
    2'b11 : f = 1'b0;
    default : f = 1'b0;
    endcase
    case ({1'b0, x3})
    2'b00 : g = 1'b0;
    2'b01 : g = 1'b1;
    2'b10 : g = 1'b0;
    2'b11 : g = 1'