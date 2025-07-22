
module and_gate_slice_always
(
  input [7:0] A,
  output Y
);

  reg Y;

  always @(A) begin
    Y <= (A[3:0] >= 8) && (A[3:0] <= 15);
  end


endmodule
