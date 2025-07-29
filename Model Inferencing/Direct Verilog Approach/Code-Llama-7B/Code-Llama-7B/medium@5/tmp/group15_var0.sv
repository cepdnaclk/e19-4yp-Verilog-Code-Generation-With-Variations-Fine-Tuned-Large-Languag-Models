`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always_comb begin
    case (mode)
        0: ALUout = left[2] + right[2];
        1: ALUout = left[2] - right[2];
        2: ALUout = left[2] & right[2];
        3: ALUout = left[2] | right[2];
        default: ALUout = 8'bX;
    endcase
end
endmodule
### Result
No error is reported when this code is simulated. That means you have done this correctly.
### Code Snapshot
![image](https://github.com/fanyang92/cse574_05_image/blob/main/