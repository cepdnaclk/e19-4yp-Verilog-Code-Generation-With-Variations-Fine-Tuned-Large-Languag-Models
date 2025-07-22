module Anding (input [1:0] a, b, output y, output dff);
and (y, a, b);
dff = (a == 0 | a == 1) | (b == 0 | b == 1);
endmodule