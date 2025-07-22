module Problem1(input [3:0] a, b, output [3:0] sum);
  logic di, clk;
  reg [3:0] q;
  DFF_1 dff_1(.di(di),.clk(clk),.q(q));
endmodule
### Output:
`ifdef SIMULATION
`endif
// module DFF_3(input[2:0] di, clk, output[2:0] q);
//   always @ (posedge clk) begin
//     q = di;
//   end
// endmodule
// module DFF_2(input[1:0] di, clk, output[1:0] q);
//   always @ (posedge clk) begin
//     q = di;
//   end
// endmodule
// module DFF_1(input di, clk, output q);
//   always @ (posedge clk) begin
//     q = di;
//   end
// endmodule