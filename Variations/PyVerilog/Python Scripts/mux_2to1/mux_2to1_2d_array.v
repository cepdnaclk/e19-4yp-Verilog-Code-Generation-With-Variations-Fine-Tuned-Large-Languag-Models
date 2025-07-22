
module mux_2to1_2d_array
(
  input [3:0] A [3:0],
  input [3:0] B [3:0],
  input SEL,
  output [3:0] Y [3:0]
);

  reg [3:0] Y [3:0];
  begin
    Y <= (SEL)? A : B;
  end

endmodule
