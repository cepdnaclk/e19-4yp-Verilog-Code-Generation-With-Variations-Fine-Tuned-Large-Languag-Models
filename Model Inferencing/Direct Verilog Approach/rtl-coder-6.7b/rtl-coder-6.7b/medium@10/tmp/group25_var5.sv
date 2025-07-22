module example7_5(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
always @(posedge Clock)
begin
    case ({x1, x2})
    2'b00:   f = 1'b0;
    2'b01:   f = 1'b0;
    2'b10:   f = x1;
    2'b11:   f = 1'b1;
    endcase
    g = f | x3;
end
endmodule
### Verilog Code:
module example7_5_2(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
always @(posedge Clock)
begin
    f = x1 & x2;
    g = f | x3;