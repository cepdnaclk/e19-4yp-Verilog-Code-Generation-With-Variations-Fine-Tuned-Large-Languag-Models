```verilog
module comp
(input wire [N-1:0] x,
input wire [N-1:0] y,
output reg gt, // Greater than
output reg eq, // Equal
output reg lt // Less than
);
generate
function[1:0] cmp(input int x, y);
case(x)
// Default outputs to 0
y: return 2'b10;
(y > x): return 2'b11;
default: return 2'b01;
endcase
endfunction
endgenerate
always @(*) // Combinational logic
begin
// Set flags based on comparison results
gt = cmp(x, y)[1];
eq = cmp(x, y)[0];
lt = ~(cmp(x, y)[0] | cmp(x, y)[1]);
end
endmodule
```