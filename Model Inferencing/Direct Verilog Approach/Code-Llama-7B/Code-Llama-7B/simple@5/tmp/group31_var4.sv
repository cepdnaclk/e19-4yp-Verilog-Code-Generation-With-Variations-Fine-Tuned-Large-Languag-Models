module func1(x1, x2, x3, f);
input x1, x2, x3;
logic signed [31:0] f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
### Original Code