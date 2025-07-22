module comp_var
(input wire [N-1:0] x,
input wire [N-1:0] y,
output reg gt, // Greater than
output reg eq, // Equal
output reg lt // Less than
);
always @(*) // Combinational logic
begin
// Default outputs to 0
gt = 1'b0;
eq = 1'b0;
lt = 1'b0;
// Set flags based on comparison results
#2 gt = (x > y);
#2 eq = (x == y);
#2 lt = (x < y);
end
endmodule
#3 Generate Block
module comp_generate
(input wire [N-1:0] x,
input wire [N-1:0] y,
output reg gt, // Greater than
output reg eq, // Equal
output reg lt // Less than
);
always @(*) // Combinational logic
begin
// Default outputs to 0
gt = 1'b0;
eq = 1'b0;
lt = 1'b0;
// Set flags based on comparison results
generate
begin
gt = (greater(x, y));
eq = (equal(x, y));
lt = (less(x, y));
end
end
endmodule
function [MAX-1:0] greater(x, y);
// Greater than
greater = (x > y);
endfunction
function [MAX-1:0] equal(x, y);
// Equal
equal = (x == y);
endfunction
function [MAX-1:0] less(x, y);
// Less than
less = (x < y);
endfunction


# Results

I've created two testbenches for the comparator and both show the correct results. For a more detailed view of the results, see:

# Conclusion

This was a quick example of how to implement verilog array indexing within generate statements. Even though the result is the same as the base verilog code, there is a difference in how the code is written.

For a more in-depth look at array indexing, you can refer to this link: Array indexing.