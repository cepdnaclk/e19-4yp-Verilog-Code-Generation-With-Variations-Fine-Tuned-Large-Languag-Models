<details>
<summary>Click here to show Modified source code.</summary>

```verilog
module p8_tb (i, o, clk_in);

// Inputs
wire i;

// Outputs
reg o[3:0];

// Clock
wire clk_in;
wire clk_out;
reg clk_reg;

// Instantiate modules
reg [3:0] in_reg;
reg [3:0] out_reg;
wire [3:0] clk_reg_out;
reg [0:0] reset_reg;
wire [0:0