module Problem8(input [3:0] a, b, output [3:0] diff);
  reg [3:0] diff;
  assign diff[0] = a[0] - b[0];
  assign diff[1] = a[1] - b[1];
  assign diff[2] = a[2] - b[2];
  assign diff[3] = a[3] - b[3];
endmodule
### Output:
```
# cd Exercises/Misc
# iverilog Problem8.sv
#./a.out
# diff 0000 0001 0002 0003 0004 0005 0006 0007 0008 0009 000a 000b 000c 000d 000e 000f 0010 0011 0012 0013 0014