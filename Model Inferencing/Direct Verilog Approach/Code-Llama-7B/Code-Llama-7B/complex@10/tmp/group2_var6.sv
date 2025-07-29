module test_multiplier;
reg clk=0, start, error; // Added clk initialization
wire [7:0] databus;
wire lsb_out, msb_out, done;
reg [7:0] mem1[0:2], mem2[0:2]; // Memory for operands
reg [7:0] im_data; // Data to drive onto bus
reg [7:0] opnd1, opnd2; // Operands
reg [15:0] expected_result, multiplier_result; // Results
integer indx; // Loop index
generate
for(indx=0; indx<4; indx++)
begin:mda_array_test
  Multiplier uut ( clk, start, databus, lsb_out, msb_out, done );
  initial begin: Apply_Data
    // --- Check all values in all memory locations ---
    foreach(mem1[i]) begin
      mem2[i] = $urandom_range(0,255); // Seed values
      opnd1 = mem1[i];
      opnd2 = mem2[i];
      // --- Driving the operands to the inputs of the multiplier ---
      #10 start = 1;
      #150;
      start = 0;
      #100;
      expected_result = opnd1 * opnd2;
    end
  end
  initial begin: Apply_Start end
  initial begin: Expected_Result end
  always @(posedge clk)
  begin: Actual_Result end
  always @(posedge clk)
  begin: Compare_Results end
end
endgenerate
// --- Clock generation ---
always #50 clk = ~clk;
// --- Data bus driving ---
assign databus = im_data; // Drive internal data onto bus
endmodule