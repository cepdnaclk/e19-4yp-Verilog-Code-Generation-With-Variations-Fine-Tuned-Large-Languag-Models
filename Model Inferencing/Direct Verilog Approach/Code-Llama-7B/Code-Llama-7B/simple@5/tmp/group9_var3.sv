module Problem8(input [3:0] a, b, output [3:0] diff);
  reg [3:0] x, y, z;
  always @(*)
  begin
    x = a + a;
    y = a * a;
    z = x / y;
    diff = a - z;