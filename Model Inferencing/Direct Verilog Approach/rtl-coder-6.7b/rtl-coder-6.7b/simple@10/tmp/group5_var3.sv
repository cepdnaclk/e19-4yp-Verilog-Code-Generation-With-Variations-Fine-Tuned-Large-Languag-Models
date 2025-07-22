module dff_p2 #(parameter n=1) (q,d,clk);
  input d, clk;
  output reg q;
  always @(posedge clk) q<=d;
endmodule