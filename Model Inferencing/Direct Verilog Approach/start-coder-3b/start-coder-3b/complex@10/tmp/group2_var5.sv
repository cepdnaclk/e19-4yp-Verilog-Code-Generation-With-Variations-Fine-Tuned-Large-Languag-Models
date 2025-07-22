```
module test_multiplier;
reg clk=0, start, error; // Added clk initialization
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
### Generated Verilog Code:
```
module test_multiplier;
reg clk = 0;
reg [7:0] databus;
wire [7:0] lsb_out, msb_out, done;
reg [7:0] mem1 [0:2], mem2 [0:2];
reg [7:0] im_data;
reg [7:0] opnd1, opnd2;
reg [15:0] expected_result, multiplier_result;
integer indx;
output reg error;

// Instantiate the Multiplier Unit Under Test
Multiplier uut ( clk, 1'b0, databus, lsb_out, msb_out, done );

always @(posedge clk) begin:
assign im_data = mem1[2];
end

always @(posedge clk) begin:
assign im_data = mem2[2];
end

always @(posedge clk) begin:
assign im_data = opnd1;
end

always @(posedge clk) begin:
assign im_data = opnd2;
end

always @(posedge clk) begin:
assign im_data = expected_result[15:8];
end

always @(posedge clk) begin:
assign im_data = lsb_out;
end

always @(posedge clk) begin:
assign im_data = multiplier_result[15:8];
end

always @(posedge clk) begin:
assign im_data = msb_out;
end

always @(negedge clk) begin:
assign error = 1'b1;
end

always @(negedge clk) begin:
assign error = 1'b0;
end

always @(negedge clk)
begin
if ( done == 1'b1)
if ( mem1 == mem2 )
assign error = 1'b0;
end
end

always @(posedge clk)
begin
if ( done == 1'b1)
if ( mem1 == mem2 )
assign error = 1'b0;
end
end

always @(posedge clk)
begin:
assign opnd1 = 'hFF;
end

always @(posedge clk)
begin
if ( done == 1'b1)
assign expected_result = 'h1234;
end
end

always @(posedge clk)
begin:
assign opnd2 = 'h1234;
end

always @(posedge clk)
begin
if ( done == 1'b1)
assign multiplier_result = 'h2468;
end
end

always @(posedge clk)
begin:
assign mem1 = opnd1;
end

always @(posedge clk)
begin:
assign mem2 = opnd2;
end

endmodule
```
### Verilog Code:
```
//
//	This Verilog module is Copyright (C) 1991-2017 by Verilog Designs Inc.
//	Notes:
//	1. The dut is assumed to be a black box -- no other nets are defined in this module.
//

// Instantiate the Multiplier Unit Under Test
wire lsb_out, msb_out, done;
reg [7:0] opnd1, opnd2;
reg [15:0] expected_result, multiplier_result;
integer indx;
output reg error;

	// Instantiate the Multiplier Unit Under Test
Multiplier uut ( clk, start, databus, lsb_out, msb_out, done );

	// --- Placeholder blocks referenced by Figure numbers ---
initial begin: Apply_Data /*... Figure 8.11... */ end
initial begin: Apply_Start /*... Figure 8.12... */ end
initial begin: Expected_Result /*... Figure 8.13... */ end
always @(posedge clk) begin: Actual_Result /*... Figure 8.14... */ end
always @(posedge clk) begin: Compare_Results /*... Figure 8.15... */ end
```
### VHDL Code:
```
//
//	This VHDL module is Copyright (C) 1991-2017 by Verilog Designs Inc.
//	Notes:
//	1. The dut is assumed to be a black box -- no other nets are defined in this module.
//

// Instantiate the Multiplier Unit Under Test
//    uut : entity
//          generic map(
//            C_DIVIDE_BY_ZERO_VALUE => to_integer(X"ABCD")
//          )
//          port map (
//            clk => clk,
//            start => start,
//            databus => databus,
//            lsb_out => lsb_out,
//            msb_out => msb_out,
//            done => done
//          );
//    uut : architecture rtl of entityMultiplier is
//		-- Verilog RTL net names
//    	-- Port map in RTL netnames
//    begin
//		-- Verilog RTL net names
//		-- Initial Block - Apply_Start
//		-- Initial Block - Apply_Data
//		-- Initial Block - Expected_Result
//		-- Always Block - Actual_Result
//		-- Always Block - Compare_Results
//		-- Clock Generation
//		-- Data_Bus Driving
//	end
```/verilog_test/test_multiplier/test_multiplier_tb/README.md
# test_multiplier_tb

This is the Testbench for the `test_multiplier` module.

## File Descriptions

* `test_multiplier_tb.sv` the Verilog code to convert the VHDL testbench into a Verilog testbench.
* `test_multiplier_tb.do` a Doxygen-formatted description of the module.
/README.md
# FPGA Proj2

## Project 2

This project is to build a multiplier module on a FPGA.

## File Descriptions

The following files are uploaded.

* `proj1.pdf` the project description in PDF.
* `proj1.zip` the project in ZIP format.
* `proj1_instructions.odt` the project instructions in ODT.
* `proj1_instructions.pdf` the project instructions in PDF.
* `proj1_instructions.pptx` the project instructions in PPTX.
* `proj1_instructions.txt` the project instructions in TXT.
* `proj1_instructions_vhd.txt` the project instructions in VHD.
* `proj1_instructions_verilog.txt` the project instructions in Verilog.
* `proj1_instructions_vhdl.txt` the project instructions in VHDL.
* `proj1_report.odt` the project report in ODT.
* `proj1_report.pdf` the project report in PDF.
* `proj1_report.pptx` the project report in PPTX.
* `proj1_report.txt` the project report in TXT.
* `proj1_report_vhd.txt` the project report in VHD.
* `proj1_report_verilog.txt` the project report in Verilog.
* `proj1_report_vhdl.txt` the project report in VHDL.
* `proj1_vhd.txt` the project in VHD.
* `proj1_verilog