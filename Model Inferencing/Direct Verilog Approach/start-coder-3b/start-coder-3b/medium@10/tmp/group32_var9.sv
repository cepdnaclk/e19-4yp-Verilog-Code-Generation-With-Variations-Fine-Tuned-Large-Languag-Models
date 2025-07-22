// flip-flop.v
module dff(do,di,clk); // Behavioral D Flip-Flop
output do;
input di,clk;
reg do; // Output must be reg for procedural assignment
initial
do=1'b0; // Initialize output
// Assign input 'di' to output 'do' on negative clock edge
always@(negedge clk) do = di; // Use non-blocking <= for sequential logic
endmodule
// main.v
module main;
reg clk;
reg [7:0] do;
reg [7:0] di;

always #(5ns) clk=!clk;

// Assign input 'di' to output 'do' on negative clock edge

dff u0(.do(do),.di(di),.clk(clk));

always @(posedge clk)
reg [7:0] d_reg; // Register must be reg for sequential logic with register
d_reg = di;
do = d_reg;
endmodule
### Synthesis Output:
Here we see the synthesized design. The output is a flip-flop with register. It is designed for the RTL compiler to run a sequential logic with register.

## 4.6 Sequential Logic with Block

Sequential Logic with Block is a design where the output changes for each clock cycle. The output is block.

### Base Verilog Code:
module dff(do,di,clk); // Behavioral D Flip-Flop
output do;
input di,clk;
reg do; // Output must be reg for procedural assignment
initial
do=1'b0; // Initialize output
// Assign input 'di' to output 'do' on negative clock edge
always@(negedge clk) do = di; // Use non-blocking <= for sequential logic
endmodule
### Variation Instruction:
Add a new module to change the flip-flop to a sequential logic with block. Also add the 'posedge' keyword to the clk signal to update the output for each clock cycle.
###