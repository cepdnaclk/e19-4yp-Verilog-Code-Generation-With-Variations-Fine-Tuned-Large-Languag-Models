module Problem10(input [3:0] a, b, output [3:0] diff);
  packed struct {
    reg [3:0] x;
    reg [3:0] y;
    reg [3:0] z;
  } val[3];
  assign val[0].x = a;
  assign val[0].y = b;
  assign val[0].z = diff;
  assign diff = val[0].x - val[0].y;
endmodule

### Base Verilog Code:
module Problem11(input [3:0