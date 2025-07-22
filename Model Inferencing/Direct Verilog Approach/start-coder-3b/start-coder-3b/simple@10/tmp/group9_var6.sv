```
module Problem8(input [3:0] a, b, output [3:0] diff);
  wire [3:0] temp, temp2;
  reg [3:0] y, z;
  assign temp = a - b;
  assign temp2 = b - a;
  assign diff[0] = a[0]^temp[0];
  assign diff[1] = a[1]^temp[1];
  assign diff[2] = a[2]^temp[2];
  assign diff[3] = b[3]^temp[3];
  assign diff[4] = b[4]^temp[4];
  assign diff[5] = b[5]^temp[5];
  assign diff[6] = b[6]^temp[6];
  assign diff[7] = b[7]^temp[7];
  assign y = diff[3:0];
  assign z = diff[7:4];
  assign diff[3:0] = y^z;
  assign diff[7:4] = y^z;
endmodule
```
### Output:
```
module Problem8(input [3:0] a, b, output [3:0] diff);
  wire [3:0] temp, temp2;
  reg [3:0] y, z;
  assign temp = a - b;
  assign temp2 = b - a;
  assign diff[0] = a[0]^temp[0];
  assign diff[1] = a[1]^temp[1];
  assign diff[2] = a[2]^temp[2];
  assign diff[3] = b[3]^temp[3];
  assign diff[4] = b[4]^temp[4];
  assign diff[5] = b[5]^temp[5];
  assign diff[6] = b[6]^temp