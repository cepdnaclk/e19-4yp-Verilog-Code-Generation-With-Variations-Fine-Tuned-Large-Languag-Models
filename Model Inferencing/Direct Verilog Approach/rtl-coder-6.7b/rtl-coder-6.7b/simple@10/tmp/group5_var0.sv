module dff_pbeh(do,di,clk);
  logic do; input di,clk;
  always @(posedge clk) begin do <= #10 di; end
endmodule