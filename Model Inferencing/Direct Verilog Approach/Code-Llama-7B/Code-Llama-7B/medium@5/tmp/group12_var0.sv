``` verilog
module maj8 (a, b, c, y);
input a, b, c;
output y;
wire im1, im2, im3, im4, im5, im6, im7, im8;
and #(2, 4)
    (im1, a, b),
    (im2, b, c),
    (im3, c, a);
or #(3, 5) (im4, im1, im2, im3);
and #(2, 4)
    (im5, b, a),
    (im6, a, c),
    (im7, c, b);
or #(3, 5) (im8, im5, im6, im7);
or #(3, 5) (y, im4, im8);
    always@(a[1:0], b[1:0], c[1:0]) begin
       y[2] = a[1] ^ b[1] ^ c[1];
       y[1] = a[0] ^ b[0] ^ c[0];
       y[0] = a[1] ^ b[1] ^ c[1];
    end
endmodule