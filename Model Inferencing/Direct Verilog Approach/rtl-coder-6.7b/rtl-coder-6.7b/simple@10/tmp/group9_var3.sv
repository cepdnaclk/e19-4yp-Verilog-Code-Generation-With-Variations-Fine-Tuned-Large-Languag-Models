module Problem8(input [3:0] a, b, output [3:0] diff);
  struct packed {
    bit x;
    bit y;
    bit z;
  } diff;

  assign diff.x = a[0];
  assign diff.y = a[1];
  assign diff.z = a[2];
endmodule