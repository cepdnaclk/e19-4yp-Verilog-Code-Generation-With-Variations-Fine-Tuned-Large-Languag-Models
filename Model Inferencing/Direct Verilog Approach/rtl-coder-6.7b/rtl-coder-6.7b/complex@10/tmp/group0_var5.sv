module or_gate
`ifdef OR_GATE_BUG
  (output reg b, input[3:0] a, input en);
  wire [1:0] b1;
  assign b = |a;
  assign b1 = a[1:0]; // OR gate selects the entire array
`else
  `or_gate(b,a,en);
`endif
endmodule