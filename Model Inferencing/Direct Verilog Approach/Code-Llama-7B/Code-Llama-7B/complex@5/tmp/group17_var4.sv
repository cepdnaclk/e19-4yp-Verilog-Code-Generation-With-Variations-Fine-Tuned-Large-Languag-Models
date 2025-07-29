module comp
(input wire [N-1:0] x,
input wire [N-1:0] y,
output reg gt, // Greater than
output reg eq, // Equal
output reg lt // Less than
);
function [3:0] get_flag;
input wire [N-1:0] x, y;
begin
if(x > y) return 4'b0100;
else if(x == y) return 4'b0010;
else return 4'b0001;
end
endfunction
generate
genvar i