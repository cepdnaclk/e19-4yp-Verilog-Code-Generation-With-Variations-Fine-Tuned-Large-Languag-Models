module Problem8(input [3:0] a, b, output [3:0] diff);
  struct packed {
    bit x;
    bit y;
    bit z;
  } packed_a, packed_b;
  assign packed_a = {1'b0, a};
  assign packed_b = {1'b0, b};
  assign diff = packed_a - packed_b;
endmodule