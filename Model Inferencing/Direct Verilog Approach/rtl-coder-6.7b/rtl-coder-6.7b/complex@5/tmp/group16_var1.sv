module TOP1 (input CLK, input RST_X);
  reg [7:0] x; reg [5:0] y;
  wire z;
  assign z = (x inside {[32'hFF01_0000 : 32'hFF01_0007], [32'hFF01_0009 : 32'hFF01_000A]}); // Comparator
endmodule