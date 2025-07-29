module maj3 (a, b, c, y);
input a, b, c;
output y;
wire im1, im2, im3;
and #(2, 4)
    (im1, a, b),
    (im2, b, c),
    (im3, c, a);
or #(3, 5) (y, im1, im2, im3);
endmodule

module top ();
wire a, b, c, d, e, f;
wire [7:0] arr[2:0];

maj3 u1
(
      .a(a),
      .b(b),
      .c(c),
      .y(arr[1])
);

maj3 u2
(
      .a(a),