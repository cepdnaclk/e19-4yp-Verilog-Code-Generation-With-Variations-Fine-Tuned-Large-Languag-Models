module test_multiplier;
reg clk=0, start, error;
wire [7:0] databus;
wire lsb_out, msb_out, done;
reg [7:0] mem1[0:2], mem2[0:2];
reg [7:0] im_data;
reg [7:0] opnd1, opnd2;
reg [15:0] expected_result, multiplier_result;
integer indx;
// Instantiate the Multiplier Unit Under Test
Multiplier uut ( clk, start, databus, lsb_out, msb_out, done );
// --- Placeholder blocks referenced by Figure numbers ---
initial begin: Apply_Data /*... Figure 8.11... */ end
initial begin: Apply_Start /*... Figure 8.12... */ end
initial begin: Expected_Result /*... Figure 8.13... */ end
always @(posedge clk)
begin: Actual_Result /*... Figure 8.14... */ end
always @(posedge clk)
begin: Compare_Results /*... Figure 8.15... */ end
// --- Clock generation ---
always #50 clk = ~clk;
// --- Data bus driving ---
assign databus = im_data; // Drive internal data onto bus
endmodule
### Code Analysis:
The Verilog Testbench code has been modified as below. The code of the modified testbench module is given below.

- A new `inside` operator is applied to the MDA array and a loop is modified to use the `inside` operator.
- The two `initial` blocks are modified to assign the arrays `mem1` and `mem2`.

### Verilog Code:
module test_multiplier;
reg clk=0, start, error;
wire [7:0] databus;
wire lsb_out, msb_out, done;
reg [7:0] mem1[0:2], mem2[0:2];
reg [7:0] im_data;
reg [7:0] opnd1, opnd2;
reg [15:0] expected_result, multiplier_result;
integer indx;
// Instantiate the Multiplier Unit Under Test
Multiplier uut ( clk, start, databus, lsb_out, msb_out, done );
// --- Placeholder blocks referenced by Figure numbers ---
initial begin: Apply_Data /*... Figure 8.11... */ end
initial begin: Apply_Start /*... Figure 8.12... */ end
initial begin: Expected_Result /*... Figure 8.13... */ end
always @(posedge clk)
begin: Actual_Result /*... Figure 8.14... */ end
always @(posedge clk)
begin: Compare_Results /*... Figure 8.15... */ end
// --- Clock generation ---
always #50 clk = ~clk;
// --- Data bus driving ---
assign databus = im_data; // Drive internal data onto bus
endmodule 
## Verilog/SystemVerilog Code of the Testbench:
```
module test_multiplier;

reg clk = 0, start, error;

wire [7:0] databus;
wire lsb_out, msb_out, done;

reg [7:0] mem1[0:2], mem2[0:2];

reg [7:0] im_data;

reg [7:0] opnd1, opnd2;

reg [15:0] expected_result, multiplier_result;

integer indx;

// Instantiate the Multiplier Unit Under Test
Multiplier uut (clk, start, databus, lsb_out, msb_out, done);

// --- Placeholder blocks referenced by Figure numbers ---

initial begin: Apply_Data /*... Figure 8.11... */ end

initial begin: Apply_Start /*... Figure 8.12... */ end

initial begin: Expected_Result /*... Figure 8.13... */ end

always @(posedge clk)
begin: Actual_Result /*... Figure 8.14... */ end

always @(posedge clk)
begin: Compare_Results /*... Figure 8.15... */ end

// --- Clock generation ---

always #50 clk = ~clk;

// --- Data bus driving ---

assign databus = im_data; // Drive internal data onto bus

endmodule
```

## Testbench Simulation:

### Simulation Results:

### Simulation with `inside` operator:
![](img/Simulation_Figure.png)
### Simulation without `inside` operator:
![](img/Simulation_Figure_without_operator.png)

## Testbench Results:

### Testbench Pass/Fail:

![](img/Result_Figure.png)

## Error Analysis:

### Test Result:

![](img/Error_Figure.png)

### Error Analysis:

### Error Analysis Results:

![](img/Error_Analysis.png)

## SystemVerilog Code of the Design:
```
`timescale 1ns / 1ps

module Multiplier(

     input  wire clk,   // Clock input

     input  wire start, // Start button

     input  wire [7:0] data_in, // Data input

     output wire [7:0] data_out, // Data output

     output reg [7:0] lsb,      // Leftmost significant bit

     output reg [7:0] msb       // Most significant bit

   );

reg [7:0] mul_result;

wire [7:0] left_shift_data = {lsb, data_out}; // Left shift data

wire [7:0] right_shift_data = {data_out[7:1], msb}; // Right Shift data

assign data_out = (start)? data_in : mul_result; // Data output

always @(posedge clk or negedge start)    // Multiply data with itself

   begin

     mul_result = data_in * data_in;

   end

always @(posedge clk) begin: left_shift

    lsb <= mul_result[7]; // Left most significant bit

    assign data_out = left_shift_data; // Update data_out with left shift data

  end

always @(posedge clk) begin: right_shift

msb <= mul_result[8];  // Most significant bit

assign data_out = right_shift_data; // Update data_out with right shift data

end

endmodule

```

## SystemVerilog Code of the Testbench:
```
`timescale 1ns / 1ps

module test_multiplier;

reg clk = 0, start;

wire [7:0] databus;

wire lsb_out, msb_out, done;

reg [7:0] mem1[0:2], mem2[0:2]; // Memory for operands

reg [7:0] im_data; // Data to drive onto bus

reg [7:0] opnd1, opnd2; // Operands

reg [15:0] expected_result, multiplier_result; // Results

integer indx; // Loop index

// Instantiate the Multiplier Unit Under Test
Multiplier uut ( clk, start, databus, lsb_out, msb_out, done );

// --- Placeholder blocks referenced by Figure numbers ---

initial begin: Apply_Data /*... Figure 8.11... */ end

initial begin: Apply_Start /*... Figure 8.12... */ end

initial begin: Expected_Result /*... Figure 8.13... */ end

always @(posedge clk)
begin: Actual_Result /*... Figure 8.14... */ end

always @(posedge clk)
begin: Compare_Results /*... Figure 8.15... */ end

// --- Clock generation ---

always #50 clk = ~clk;

// --- Data bus driving ---

assign databus = im_data; // Drive internal data onto bus

endmodule
```

## Testbench Simulation:

### Testbench Results:

### Testbench Results (without operator):

## Testbench Results:

### Test Result:

![](img/Result_Figure.png)

## Error Analysis:

### Error Analysis Results:

## SystemVerilog Code of the Design:
```
`timescale 1ns / 1ps

module Multiplier(

     input  wire clk,   // Clock input

     input  wire start, // Start button

     input  wire [7:0] data_in, // Data input

     output wire [7:0] data_out, // Data output

     output reg [7:0] lsb,      // Leftmost significant bit

     output reg [7:0] msb       // Most significant bit

   );

reg [7:0] mul_result;

wire [7:0]