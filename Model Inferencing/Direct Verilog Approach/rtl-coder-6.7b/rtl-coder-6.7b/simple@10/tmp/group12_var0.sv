module Problem1(input [3:0] a, b, output logic [3:0] sum);
  reg [3:0] di, clk;
  assign sum = a + b;
endmodule