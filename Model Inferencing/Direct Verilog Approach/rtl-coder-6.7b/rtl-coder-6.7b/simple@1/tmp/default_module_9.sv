module Problem8(input [3:0] a, b, output [3:0] diff);
  packed struct {
    reg x, y, z;
  } in;
  packed struct {reg [3:0] x, y, z;} out;
  assign in.x = a;
  assign in.y = b;
  assign out.x = in.x - in.y;
endmodule
### Variation Output:
Outputs x when x is assigned to diff, and y when y is assigned to diff.
### Solution Code:
module Problem8(input [3:0] a, b, output [3:0] diff);
  packed struct {
    reg x, y, z;
  } in;
  packed struct {reg [3:0] x, y, z;} out;
  assign in.x = a;
  assign in.y = b;
  assign out.x = in.x - in.y;
  assign diff = out.x;
endmodule