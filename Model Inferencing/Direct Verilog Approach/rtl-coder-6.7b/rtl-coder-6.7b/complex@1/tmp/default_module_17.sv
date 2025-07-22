module comp
(input wire [N-1:0] x,
input wire [N-1:0] y,
output reg gt, // Greater than
output reg eq, // Equal
output reg lt // Less than
);
function [N-1:0] comparison(input x, y);
comparison = x > y? x : y;
endfunction
if(comparison(x, y))
gt = 1'b1;
else if(comparison(x, y))
eq = 1'b1;
else if(comparison(x, y))
lt = 1'b1;
endmodule