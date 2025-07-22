module example7_5(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
always @(posedge Clock)
begin
    f = x1 & x2;
    g = f | x3;
    case (i)
        1 : f = x1 & x2;
        2 : g = f | x3;
    endcase
end
endmodule