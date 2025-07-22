`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always_comb begin
    case (mode)
        0: ALUout[left + right];
        1: ALUout[left - right];
        2: ALUout[left & right];
        3: ALUout[left | right];
        default: ALUout = 8'bX;
    endcase
end
endmodule
### Simulation Result:
![Result](https://imgur.com/gYj0wC8.png)
### Possible Problem:
The error message "Index too large" is given, which means that the given index of the array is too large.
### Possible Solution:
Increasing the array size, which should be done for other data types than for strings and may cause problems.