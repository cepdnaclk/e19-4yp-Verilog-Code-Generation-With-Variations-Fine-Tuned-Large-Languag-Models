module ALU( input [7:0] A, input [7:0] B, input mode,
output reg [7:0] sum);
  // Unpacked 1D array
  logic op_valid [1:0];
  // 2D array
  logic op_valid2 [0:4][0:4];

  // Inside expression
  logic [1:0] op = A[1:0];