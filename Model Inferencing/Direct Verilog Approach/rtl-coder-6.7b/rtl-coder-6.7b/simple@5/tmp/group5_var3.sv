module dff_p(output logic q,input logic d,input logic clk);
  always @(posedge clk) q <= d;
endmodule