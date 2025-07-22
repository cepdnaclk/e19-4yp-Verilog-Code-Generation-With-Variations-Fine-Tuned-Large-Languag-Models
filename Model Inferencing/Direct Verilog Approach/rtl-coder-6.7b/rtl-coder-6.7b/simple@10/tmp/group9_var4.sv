module Problem8(input [3:0] a, b, output reg [3:0] diff, y, z);
  reg [3:0] x;
  always @(*) begin
    x = a - b;
  end
  assign {z,y,diff} = {3{x}};
endmodule
### Results:
```
Writing "Problem8.v"
  **********************
  Module Instantiations:
  **********************
  Problem8

  Problem8 Problem8_44(input [3:0] a, b, output reg [3:0] diff, y, z);
  Problem8_44 : Problem8
    a : a
    b : b
    diff : diff
    y : y
    z : z

  **********************
  Verilog Source:
  **********************

  module Problem8(input [3:0] a, b, output [3:0] diff);
    assign diff = a - b;
  endmodule

  **********************
  Verilog Translation:
  **********************

  module Problem8(input [3:0] a, b, output [3:0] diff, y, z);
    reg [3:0] x;
    always @(*) begin
      x = a - b;
    end
    assign {z,y,diff} = {3{x}};
  endmodule
```