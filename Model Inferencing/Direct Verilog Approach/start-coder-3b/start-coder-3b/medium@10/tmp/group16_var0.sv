module and2(
input wire [1:0] a,
input wire [1:0] b,
output reg [1:0] y
);
always @(*)
case(a)
0: y = 0;
1: y = b;
endcase
endmodule
### Performance:
Performance does not change, so it was not necessary to modify the performance measurements.