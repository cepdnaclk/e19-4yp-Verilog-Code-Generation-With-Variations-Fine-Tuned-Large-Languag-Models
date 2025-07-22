`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always_comb begin
   ALUout = {left[1:0], left[7:6], left[3:0], left[5:4], left[4:2]} + {right[7:4], right[3:0], right[1:0], right[5:4], right[4:2]}; 
end
endmodule`
### Result:
![6 2_1a](https://user-images.githubusercontent.com/71428673/122381659-49c32f00-cf6a-11eb-8316-d481e78733c9.PNG)

## #6_2_1b
### Base Verilog Code:
`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [