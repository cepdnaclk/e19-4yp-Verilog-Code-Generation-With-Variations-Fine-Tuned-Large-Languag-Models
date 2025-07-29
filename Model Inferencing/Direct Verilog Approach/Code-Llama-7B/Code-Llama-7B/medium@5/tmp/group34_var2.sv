module gated_seq (
input wire [3:0] sw,
output reg [2:0] ld
);
always @ (sw)
  case (sw)
    4'b1011 : ld = 4'b0100;
    4'b0101 : ld = 4'b0100;
    4'b1100 : ld = 4'b0100;
    4'b1110 : ld = 4'b0100;
    4'b0111 : ld = 4'b1000;
    4'b1001 : ld = 4'b1000;
    4'b1010 : ld = 4'b1000;
    4'b1111 : ld = 4'b1000;
    default : ld = 4'b0000;
  endcase
endmodule
### Testing the Code:
* Please write at least three cases for each variation and verify that your code is working.
### Notes:
* You may use any hardware structure for this.
* You may be required to update your existing code to get the desired results.

### Output of the Code:
![alt text](https://github.com/gururajbali/VIVADO-CSE-293/blob/main/Lab%20Assignments/Lab%207/Gate%204/output.png?raw=true)

### Lab 8
#### 10th Lab Assignment
### Verilog Gated Sequential Circuit
### Base Verilog Code:
module gated_seq (
input wire [3:0] sw,
output reg [2:0] ld
);
always @ (sw)
  case (sw)
    4'b1011 : ld = 4'b0100;
    4'b0101 : ld = 4'b0100;
    4'b1100 : ld = 4'b0100;
    4'b1110 : ld = 4'