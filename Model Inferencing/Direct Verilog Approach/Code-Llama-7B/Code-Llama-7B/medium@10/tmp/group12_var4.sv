module maj3 (a, b, c, y);
input a, b, c;
output y;
wire im1, im2, im3;
and #(2, 4)
    (im1, a[1:0], b),
    (im2, b, c),
    (im3, c, a);
or #(3, 5) (y, im1, im2, im3);
endmodule
### Verification Steps:
1. Compile and run simulation with the modified code on the base verilog.
2. Compile and run simulation with the modified code on the modified verilog.
3. Compare the outputs.
### Expected Output: