module comp
(input wire [N-1:0] x,
input wire [N-1:0] y,
output reg gt, // Greater than
output reg eq, // Equal
output reg lt // Less than
);
always @*
begin
// Default outputs to 0
gt = 1'b0;
eq = 1'b0;
lt = 1'b0;

// Generate the comparisons
generate
for(int i = 0; i < N; i++)
begin
end
endgenerate
end

module comp_module
(input wire [N-1:0] x,
input wire [N-1:0] y,
output wire gt, // Greater than
output wire eq, // Equal
output wire lt // Less than
);
input wire [N-1:0] x;
input wire [N-1:0] y;
output wire gt;
output wire eq;
output wire lt;

// Generate the comparisons
generate
for(int i = 0; i < N; i++)
begin

end
endgenerate
endmodule

##### Verilog Style 108:

### Base Verilog Code:
module comp
(input wire [N-1:0] x,
input wire [N-1:0] y,
output reg gt, // Greater than
output reg eq,