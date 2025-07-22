module func14(x, f);
input x;
output f;
assign f = x? ~x : x;
endmodule

### Base Verilog Code:
module func15(x1, x2, x3, f);
input x1, x2, x3;
output f;
assign f = ~x1 & x2 & ~x3 | ~x1 & ~x2 & x3 | ~x1 & x2 & x3 | x1 &