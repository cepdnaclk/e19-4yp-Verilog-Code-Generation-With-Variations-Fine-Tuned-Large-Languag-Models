module tst_nm_inv_array();
  reg [3:0] in; wire [3:0] out;
  NMOSinv_4D nmv[4](out,in); // Array of NMOS inverters
  initial
     in =4'b1010; // Start with input high -> output low
  always 
     initial $monitor($time, " in = %b, output = %b ",in,out);
  initial #15 $stop; // Stop simulation
endmodule
### Output Example:
  vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
  # 15 :    in = 1010, output = 0101
  ^ 
  # 16 :    in = 1010, output = 0101
  vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
  # 17 :    in = 1010, output = 0101
  vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
  # 18 :    in = 1010, output = 0101
  vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
  # 19 :    in = 1010, output = 0101
  vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
  # 20 :    in = 1010, output = 0101
  vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv