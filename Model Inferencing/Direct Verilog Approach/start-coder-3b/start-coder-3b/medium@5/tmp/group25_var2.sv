module example7_24(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
always @(posedge Clock)
begin
    f = x1 & x2;
    g = f | x3;
end
endmodule
### Base Verilog Code:
module example7_25(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
always @(posedge Clock)
begin
    f = x1 & x2;
    g = f | x3;
end
endmodule
### Variation Instruction:
Add inside an if statement using if..