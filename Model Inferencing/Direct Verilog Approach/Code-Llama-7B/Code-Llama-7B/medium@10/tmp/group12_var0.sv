module maj5 (a, b, c, y);
input a, b, c;
output y;
wire im1, im2, im3;
and #(2, 4)
    (im1, a, b),
    (im2, b, c),
    (im3, c, a);
or #(3, 5) (y, im1, im2, im3);
always @ (a, b, c, y) begin
    x[0] <= a;
    x[1:2] <= b;
    x[3] <= c;
end
endmodule
### Runtime Instruction(s):
x = [0 1 0 1 0]
### Verification Instruction(s):
x[0:2] = x[1:3]
### Runtime Test Input:
x: [0 1 0 1 0]
### Runtime Test Output:
y: 0
### Runtime Test Success
### End of Test
### Base Verilog Code:
module maj6 (a, b, c, y);
input a, b, c;
output y;
wire im1, im2, im3;
and #(2, 4)
    (im