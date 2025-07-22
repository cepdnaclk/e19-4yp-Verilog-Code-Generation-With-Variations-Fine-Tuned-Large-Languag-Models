always @(posedge Clock)
begin
case (a)
    1: q <= ~ (x & y);
    2: q <= ~x & ~y;
    3: q <= ~x & y;
    4: q <= x & ~y;
endcase
end
### Result:
## 13.
### Base Verilog Code:
module example7_13(x, y, Clock, q);
input  x, y, Clock;
output q;
reg q;
always @(posedge Clock)
begin
q <= ~ (x | y);
end
endmodule
### Variation Instruction:
Use the bitwise not operator, ~,