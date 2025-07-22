module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire [3:0] s,
output wire [3:0] y
);

always @(*) begin
int i;
for(i=0; i<8; i++) begin
if(s == i)
y = i < 4? a : i;
end
endfunction
endmodule

### Problem:
The XMR-style iteration currently does not support using the + operator for a constant value.

### Solution:
Add an if block using inside on a 2D array selected using XMR-style hierarchy for index expression.

## 8.36  X