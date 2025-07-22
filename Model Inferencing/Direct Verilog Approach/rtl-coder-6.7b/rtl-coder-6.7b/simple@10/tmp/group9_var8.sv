package Problem8Package;
  typedef struct {
    reg x, y, z;
  } Problem8Packed;
endpackage
module Problem8(input Problem8Package::Problem8Packed a, b, output Problem8Package::Problem8Packed diff);
  assign diff.x = a.x - b.x;
  assign diff.y = a.y - b.y;
  assign diff.z = a.z - b.z;
endmodule
### Variation Info:
Packed Structure
### Test Cases:
#### Test Inputs:
x=1, y=1, z=0, a.x=1, a.y=1, a.z=0, b.x=1, b.y=1, b.z=0
#### Expected Outputs:
x=0, y=0, z=0