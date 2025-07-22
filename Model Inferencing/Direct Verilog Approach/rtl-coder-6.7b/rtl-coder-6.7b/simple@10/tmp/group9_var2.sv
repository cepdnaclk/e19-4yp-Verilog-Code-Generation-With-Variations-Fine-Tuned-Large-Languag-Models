module Problem8New(input [3:0] a, b, output [3:0] diff);
  assign diff = a - b;
endmodule
### Test Case:
`timescale 1ns/1ns
module Test;
  reg [3:0] a;
  reg [3:0] b;
  wire [3:0] diff;
  Problem8 UUT(.a(a),.b(b),.diff(diff));
  initial
  begin
    $monitor("%d - %d = %d", a, b, diff);
    a = 0;
    b = 0;
    #10;
    a = 1;
    b = 1;
    #10;
    a = 5;
    b = 3;
    #10;
    a = 8;
    b = 3;
    #10;
    a = 10;
    b = 4;
    #10;
    $finish;
  end
endmodule