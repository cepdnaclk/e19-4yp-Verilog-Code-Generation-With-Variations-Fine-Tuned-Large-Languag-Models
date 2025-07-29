module tst_nm_in();
  reg in; wire out;
  NMOSinv nmv(out,in); // Instantiate NMOS inverter
  initial
    in =1'b1; // Start with input high -> output low
  initial begin
    out = out_fun(in); // Use function to get output
  end
  always
  initial $monitor($time, " in = %b, output = %b ",in,out);
  initial $stop; // Stop simulation
  // Function to get output from array
  function [1:0] out_fun(input [1:0] inp);
    begin
      case(inp)
        2'b00: out_fun = 2'b01;
        2'b01: out_fun = 2'b10;
        2'b10: out_fun = 2'b11;
        2'b11