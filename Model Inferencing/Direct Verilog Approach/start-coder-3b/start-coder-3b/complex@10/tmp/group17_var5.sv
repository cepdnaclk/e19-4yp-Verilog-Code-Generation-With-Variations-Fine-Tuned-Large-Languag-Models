module comp
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
casex(x)
16'd0:
gt = 1'b1;
16'd1:
eq = 1'b1;
default:
endcase
end
endmodule
### Result:
No issues were found that would impede the synthesis process.