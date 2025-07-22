// Verilog code for Problem 4
module XOR_Gate(
    input logic A[1:0] [0:3],
    output logic Y[1:0] [0:3]
);
    always_comb begin
        for (int i = 0; i < 4; i++) begin
            Y[0][i] = A[0][i] ^ A[1][i];
        end
    end
endmodule
### Variation Result:
XOR_Gate_test.sv
// Testbench code for Problem 4
module XOR_Gate_test;
// Define constants for input and output signals
localparam int INPUT_WIDTH = 2; // number of inputs
localparam int INPUT_SIZE = 4; // number of inputs per port
localparam int OUTPUT_WIDTH = 1; // number of outputs
localparam int OUTPUT_SIZE = 4; // number of outputs per port
// Define signal types and widths
logic in_A[INPUT_WIDTH - 1:0] [INPUT_SIZE - 1:0];
logic out_Y[OUTPUT_WIDTH - 1:0] [OUTPUT_SIZE - 1:0];
// Instantiate top-level module
XOR_Gate uut(
.A(in_A),
.Y(out_Y)
);
// Test input values
initial begin
// Set input values
in_A = 0;
in_A[0][0] = 1'b0; in_A[0][1] = 1'b1; in_A[0][2] = 1'b0; in_A[0][3] = 1'b1;
in_A[1][0] = 1'b1; in_A[1][1] = 1'b1; in_A[1][2] = 1'b1; in_A[1][3] = 1'b1;
// Wait for outputs to settle
#1;
// Check output values
assert (out_Y[0][0] === 1'b1);
assert (out_Y[0][1] === 1'b0);
assert (out_Y[0][2] === 1'b