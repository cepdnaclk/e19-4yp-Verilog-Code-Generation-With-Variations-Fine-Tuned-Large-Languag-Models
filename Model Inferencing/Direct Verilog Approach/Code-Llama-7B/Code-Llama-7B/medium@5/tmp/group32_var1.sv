module dff_reset(do,di,clk,rst); // Behavioral D Flip-Flop
output do;
input di,clk,rst;
reg do; // Output must be reg for procedural assignment
initial
begin do=1'b1; // Initialize output
do = di; // Assign input 'di' to output 'do' on negative clock edge
end
always @ (posedge clk or posedge rst)
begin
if (rst==1')
begin
do=1'b0;
end
else
do=di;
end
endmodule
### Simulation Results:
![image](https://user-images.githubusercontent.com/90644103/162458391-c0243973-6b73-4288-a89c-656d90779077.png)

## Part-4 Verilog Code Improvements

### Behavioral D Flip-Flop with Reset and Preset
module dff(do,di,clk,rst,preset); // Behavioral D Flip-