```
module comparator
(input wire [N-1:0] x,
input wire [N-1:0] y,
output wire gt, // Greater than
output wire eq, // Equal
output wire lt // Less than
);
always @(*)
begin
#1;
gt = x > y;
eq = x == y;
lt = x < y;
end
endmodule
module comparator_top
#(
parameter N = 8,
parameter M = 3 // Number of comparators
)
(input wire [N-1:0] pc,
input wire [N-1:0] inst_addr,
input wire [(M*N)-1:0] sorted_inst_addr,
input wire [M-1:0] sels,
output wire equal
);
always @(*)
begin
equal = 1'b0;
// Pick an instruction address from the sorted array based on
// the selects bits
if(concatenate(sorted_inst_addr) inside(inst_addr))
equal = 1'b1;
end
endmodule
```