module Problem10(input [3:0] a, b, output [3:0] diff);
  struct packed{
    logic [3:0] x;
    logic [3:0] y;
    logic [3:0] z;
  }my_struct;
  assign my_struct = a;
  assign diff = (my_struct.x + my_struct.y) + my_struct