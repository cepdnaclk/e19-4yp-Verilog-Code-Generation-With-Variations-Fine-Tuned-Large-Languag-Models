module counter (
    input wire clk, rst,
    output reg [3:0] count
);
always @* begin
	count = count + 1;
end
endmodule
### Comments:
This should result in a behavioral simulation with the same waveform as the previous code except this assignment should be done within the always block of the module, not the initial block.
### Expected Waveform:
![](./images/15_001.png)
### Unexpected Waveform:
![](./images/15_002.png)

## Task 16:
### Base Verilog Code:
module counter (
    input wire clk, rst,
    output reg [3:0] count
);
wire [3:0] tmp;
always @(posedge clk or posedge rst) begin
    if (rst) count <= 4'b0000;
    else tmp <= count + 1;
    count <= tmp;
end
endmodule
### Variation Instruction:
Take all of the functionality within the continuous assignment and