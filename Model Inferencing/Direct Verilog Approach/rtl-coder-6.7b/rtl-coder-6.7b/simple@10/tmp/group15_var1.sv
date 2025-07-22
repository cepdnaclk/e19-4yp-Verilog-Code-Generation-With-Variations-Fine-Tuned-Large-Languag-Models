module sw2led2 (
input wire [7:0] sw,
output wire [7:0] ld
) ;
assign ld[7] = sw[7];
assign ld[6:0] = sw[6:0];
endmodule
### Output:
###
### sw = xxxxxxxx
### ld = xxxxxxxx
### sw = 10000000
### ld = 01111111
### sw = xxxxxxxx
### ld = xxxxxxxx
### sw = xxxxxxxx
### ld = xxxxxxxx
### sw = 00000000
### ld = xxxxxxxx
### sw = 00000000
### ld = 00000000
### sw = 00000010
### ld = 00000010
### sw = 00000011
### ld = 00000011
### sw = 00000100
### ld = 00000100
### sw = 00000101
### ld = 00000101
### sw = 00000110
### ld = 00000110
### sw = 00000111
### ld = 00000111
### sw = 00001000
### ld = 00001000
### sw = 00001001
### ld = 00001001
### sw = 00001010
### ld = 00001010
### sw = 00001011
### ld = 00001011
### sw = 00001100
### ld = 00001100
### sw = 00001101
### ld = 00001101
### sw = 00001110
### ld = 00001110
### sw = 00