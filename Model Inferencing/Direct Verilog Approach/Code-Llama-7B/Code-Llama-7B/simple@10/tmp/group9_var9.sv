module Problem8(input [3:0] a, b, output [3:0] diff);
  typedef struct packed {
    logic x, y, z; // x, y, z are bit vectors
  } t_diff;
  t_diff difference; // difference is a packed structure of type t_diff
  assign difference.x = a[0] ^ b[0]; // x is xor of a[0] and b[0]
  assign difference.y = a[1] ^ b[1]; // y is xor of a[1] and b[1]
  assign