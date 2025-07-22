module Problem8(input [3:0] a, b, output [3:0] diff);
  logic [3:0] x, y, z;
  struct packed {logic [3:0] a; logic [3:0] b; logic [3:0] diff;} packed_struct = {a, b, 'b0};
  assign x = packed_struct.a;
  assign y = packed_struct.b;
  assign z = packed_struct.diff;
  assign diff = z;
endmodule
### Reference solution:
module Problem8(input [3:0] a, b, output [3:0] diff);
  assign diff = a - b;
endmodule