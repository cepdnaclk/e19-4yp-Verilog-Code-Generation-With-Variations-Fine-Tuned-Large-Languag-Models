```
module Multiplier_4bit(input [3:0] A, B, output C);
wire [7:0] AB;
assign AB = A*B;
assign C = AB[7:4] && AB[3:0];
endmodule

module Multiplier_4bit_ovf(input [3:0] A, B, output C);
wire [7:0] AB;
assign AB = A*B;
assign C = AB[8]? 8'b1 : AB[7:4] && AB[3:0];
endmodule
```
### Simulation
#### Reference Simulation
![ref](https://github.com/DuminduNuwan1985/Digital-Logic-Lab-Experiments/blob/master/DL/Multiplier_Experiments/images/mult_4_ref.png)
#### Variation Simulation
![var](https://github.com/DuminduNuwan1985/Digital-Logic-Lab-Experiments/blob/master/DL/Multiplier_Experiments/images/mult_4_var.png)
#### Difference Image
![diff](https://github.com/DuminduNuwan1985/Digital-Logic-Lab-Experiments/blob/master/DL/Multiplier_Experiments/images/mult_4_diff.png)

## 12. Design a 4-bit adder to add 2 4-bit numbers A[3:0], B[3:0], and an 8-bit result C[7:0]. The adder should implement the overflow condition.
### Base Verilog Code:
```
module Adder_4bit(input [3:0] A, B, output reg [7:0] C);
assign C[7] = A[3]