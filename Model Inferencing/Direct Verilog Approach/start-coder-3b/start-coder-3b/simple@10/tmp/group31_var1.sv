module adder(a, b, s, c, ci);
input a, b;
output s, c, ci;
assign ci = a[2:0] | b[2:0];
assign s = a[2:0] ^ b[2:0];
assign c = a[2:0] & b[2:0];
endmodule
### Test Code:
module tb;
reg a, b;
reg [1:0] c, ci;
initial begin
assign a = 0;
assign b = 0;
end
initial begin
assign a = 0;
assign b = 1;
end
initial begin
assign a = 1;
assign b = 0;
end
initial begin
assign a = 1;
assign b = 1;
end
endmodule
### Expected Results:
Test passed.

# 13
## Base Verilog Code:
module adder(a, b, s, c, ci);
input a, b;
output s, c, ci;
assign ci = a | b;
assign s = a ^ b;