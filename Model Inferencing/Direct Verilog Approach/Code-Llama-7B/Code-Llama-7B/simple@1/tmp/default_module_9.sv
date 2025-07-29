module Problem8(input [3:0] a, b, output [3:0] diff);
  struct packed {
    logic x;
    logic y;
    logic z;
  } t;
  assign t = a;
  assign t