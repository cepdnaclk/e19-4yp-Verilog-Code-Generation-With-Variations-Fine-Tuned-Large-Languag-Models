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
assign databus = im_data;
endmodule

## 8.8 Exercises

1. Consider the design shown in Figure 8.16. The design includes two unit tests that exercise a multiplier unit and a memory unit. These unit tests use the same design for the multiplier unit and memory unit. Write a test bench for the multiplier unit that exercises the multiplier unit with the same code as the memory unit. The memory unit has code similar to the memory unit except that it exercises the memory unit.

2. Write a test bench that exercises all the functional units of a 64-bit CPU. The test bench should drive the instruction and operand memory of the CPU, step the clocks until the state of the processor is set to running, and then step forward the clock until the result of the instruction is ready. The test bench should verify that the result is correct.

3. (Extra Credit) Write a test bench that tests the behavior of the adder and multiplier in Figure 8.15. The test bench should verify that the adder and multiplier behave the same as the truth table in Figure 8.15.

4. (Extra Credit) For each of the designs in Figure 8.16, write the memory initialization code, the test code, and the test bench.

5. (Extra Credit) Write a test bench for the simple memory unit. The test bench should initialize the memory with 80 and 81. Then, the test bench should drive the databus with 100 and 101, with clock pulses at the rising edge of the clock. The test bench should check that the result is correct.

## References

•,, and. Testing Digital Circuits Using SystemVerilog,, 2004.