module comp
(input wire [N-1:0] x,
input wire [N-1:0] y,
output reg gt, // Greater than
output reg eq, // Equal
output reg lt // Less than
);
function [1:0] compare;
input [N-1:0] x, y;
compare = (x > y)? 2'b10 : (x == y)? 2'b01 : 2'b11;
endfunction
generate
for(genvar i = 0; i < N; i = i + 1)
begin: inside
always @(*)
begin
gt &= compare[0];
eq &= compare[1];
lt &= compare[2];
end
end
endgenerate
endmodule

###