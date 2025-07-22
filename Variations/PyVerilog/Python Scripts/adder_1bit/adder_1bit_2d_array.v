
module adder_1bit_2d_array
(
  input [3:0] A [3:0],
  input [3:0] B [3:0],
  input CIN,
  output [3:0] SUM [3:0]
);

  reg [3:0] SUM [3:0];
  begin
    SUM <= A ^ B ^ CIN;
  end

endmodule
