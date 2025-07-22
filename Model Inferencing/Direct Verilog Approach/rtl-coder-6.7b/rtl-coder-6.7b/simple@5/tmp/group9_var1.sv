module Problem8(input [3:0] a, b, input x, y, z, output [3:0] diff, x, y, z);
  reg [3:0] diff;
  struct packed { reg x, y, z; } myStruct;
  always @* begin
    diff = a - b;
    myStruct = {x, y, z};
  end
endmodule
### Solution:
module Problem8(input [3:0] a, b, input x, y, z, output [3:0] diff, x, y, z);
  reg [3:0] diff;
  struct packed { reg x, y, z; } myStruct;
  always @* begin
    diff = a - b;
    myStruct = {x, y, z};
  end
endmodule