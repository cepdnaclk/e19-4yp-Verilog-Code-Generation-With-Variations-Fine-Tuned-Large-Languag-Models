module Problem8(input [3:0] a, b, output [3:0] diff);
  reg [3:0] x, y, z;
  assign x = a;
  assign y = b;
  assign z = x - y;
  assign diff = z;
endmodule
### Test Bench
module Problem8_test;
  reg [3:0] a, b;
  wire [3:0] diff;
  Problem8 P8(a, b, diff);
  initial begin
    a = 4;
    b = 1;
    #10 $display("a = %d, b = %d, diff = %d", a, b, diff);
    a = 7;
    b = 3;
    #10 $display("a = %d, b = %d, diff = %d", a, b, diff);
  end
endmodule
#### Simulation results