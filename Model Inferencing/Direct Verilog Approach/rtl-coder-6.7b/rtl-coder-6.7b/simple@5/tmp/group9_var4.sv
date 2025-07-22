module Problem8(input [3:0] a, b, output [3:0] diff);
  struct packed {reg x, y, z;} A, B;
  initial begin
      A.x = a[3];
      A.y = a[2];
      A.z = a[1:0];
      B.x = b[3];
      B.y = b[2];
      B.z = b[1:0];
  end
  assign diff = B - A;
endmodule