
module and_gate_2d_array_loop
(
  input [3:0] A [3:0],
  input [3:0] B [3:0],
  output [3:0] Y [3:0]
);

  reg [3:0] Y [3:0];
  begin
    for(i=0; i<4; i=i+1) begin
      Y[i] <= A[i] & B[i];
    end
  end

endmodule
