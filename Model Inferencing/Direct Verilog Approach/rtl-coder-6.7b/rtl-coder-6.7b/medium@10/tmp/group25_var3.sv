module example7_5_mod_2(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
always @(posedge Clock)
begin
    f = x1 & x2;
    g = f | x3;
end
endmodule
In a case expression, if the value of an array element is selected via a dynamic variable index, the array value is unknown.