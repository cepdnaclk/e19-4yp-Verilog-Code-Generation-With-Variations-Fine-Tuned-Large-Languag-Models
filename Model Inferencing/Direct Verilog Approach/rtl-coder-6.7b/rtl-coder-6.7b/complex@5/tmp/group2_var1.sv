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
initial begin: Apply_Data
genvar i;
integer j;
generate
for(i=0; i<3; i=i+1) begin: apply_mem1
for(j=0; j<8; j=j+1) begin
im_data <= mem1[i]; // Drive internal data onto bus
$display("memory1[%0d]: %b", i, mem1[i]);
@(negedge clk);
end
end
endgenerate
end
initial begin: Apply_Start
start <= 0;
end
initial begin: Expected_Result
expected_result <= opnd1 * opnd2;
end
always @(posedge clk)
begin: Actual_Result
multiplier_result <= {{lsb_out, lsb_out}, {msb_out, msb_out}};
end
always @(posedge clk)
begin: Compare_Results
if (expected_result!= multiplier_result)
$display("Error: Expected = %b", expected_result);
else
$display("Multiplier Result = %b", multiplier_result);
end
// --- Clock generation ---
always #50 clk = ~clk;
// --- Data bus driving ---
assign databus = im_data; // Drive internal data onto bus
endmodule