module example7_5(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
always @(*Clock)
begin
    f = x1 & x2;
    g = f | x3;
end

function f1(Clock, f, g);
input Clock;
output f, g;
reg f, g;
case (Clock) 
    1'b0: f = Clock & Clock;
    1'b1: f = Clock & Clock;
    1'b0: f = Clock & Clock;
    1'b1: f = Clock & Clock;
    1'b0: