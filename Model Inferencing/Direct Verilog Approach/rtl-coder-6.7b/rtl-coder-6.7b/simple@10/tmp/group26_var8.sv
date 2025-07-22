module gade(a,b);
input [3:0]b;
output a;
and #1 gg1(a,b);
endmodule
module dade(a);
input [3:0][11:0]a;
output [19:0]b;
assign b=a[3][11:0];
endmodule