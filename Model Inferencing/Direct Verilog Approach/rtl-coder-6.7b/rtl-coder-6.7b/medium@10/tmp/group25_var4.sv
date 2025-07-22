module example7_5(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
always @(posedge Clock)
begin
    case ({x1,x2})
        2'b00:  f = 1'bx;
        2'b01:  f = 1'b0;
        2'b10:  f = 1'b1;
        2'b11:  f = x3;
    endcase
    g = f | x3;
end
endmodule
### Base Output:
### Design Output:
### System Output: