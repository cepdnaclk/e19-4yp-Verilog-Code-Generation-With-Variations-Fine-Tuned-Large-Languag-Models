```
module Problem8(input [3:0] a, b, output [3:0] diff);
  reg [19:0] x,y,z;
  assign x = a[7:0];
  assign y = a[15:8];
  assign z = a[19:16];
  assign diff[7:0] = x - y - z;
  assign diff[15:8] = y - z - x;
  assign diff[19:16] = z - x - y;
endmodule
```
### Testbench Code:
```
module Problem8_tb;
  reg [3:0] a, b;
  wire [3:0] diff;
  Problem8 problem8(a,b,diff);

  initial begin
    a = 14;
    b = 7;
    #10
    a = 2;
    b = 3;
    #10
    $stop;
  end
endmodule
```
### Expected Results:
```
a=14, b=7 -> diff=12
a=2, b=3 -> diff=0
```
### Observed Results:
```
a=14, b=7 -> diff=12
a