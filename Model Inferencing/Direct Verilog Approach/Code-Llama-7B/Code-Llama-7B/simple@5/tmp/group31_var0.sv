module func1(x1, x2, x3, f);
input x1, x2, x3;
logic signed [1:0] f;
parameter p = 8'b00001000;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule