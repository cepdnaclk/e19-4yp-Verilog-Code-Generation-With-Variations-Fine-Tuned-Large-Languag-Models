module func1(x1, x2, x3, f);
input x1, x2, x3;
output logic signed [3:0] f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule