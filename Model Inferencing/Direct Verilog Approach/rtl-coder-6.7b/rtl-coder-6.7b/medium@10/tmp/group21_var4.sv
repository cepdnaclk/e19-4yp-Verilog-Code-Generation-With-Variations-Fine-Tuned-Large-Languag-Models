module tst_nm_in();
  reg in; wire out;
  // 16x16x16x1 LUT
  wire [15:0] LUT [0:15][0:15][0:15][0:15];
  // Function for 4D array indexing
  function [15:0] f_index(input [3:0] v);
    f_index = LUT[v[3]][v[2]][v[1]][v[0]];
  endfunction
  NMOSinv nmv(out,in); // Instantiate NMOS inverter
  initial
    in =1'b1; // Start with input high -> output low
  always
    #1 $display($time, " in = %b, output = %b ",in,out);
  initial #15 $stop; // Stop simulation
  always
    $readmemb("nm.dat",LUT); // Read LUT values from file
endmodule
### Output:
12750 in = 1, output = 0 
12850 in = 1, output = 0 
12950 in = 1, output = 0 
13050 in = 1, output = 0 
13150 in = 1, output = 0 
13250 in = 1, output = 0 
13350 in = 1, output = 0 
13450 in = 1, output = 0 
13550 in = 1, output = 0 
13650 in = 1, output = 0 
13750 in = 1, output = 0 
13850 in = 1, output = 0 
13950 in = 1, output = 0 
14050 in = 1, output = 0 
14150 in = 1, output = 0 
14250 in = 1, output = 0 
14350 in = 1, output = 0