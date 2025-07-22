module func1(x1, x2, x3, f);
input logic x1, x2, x3;
output logic f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule