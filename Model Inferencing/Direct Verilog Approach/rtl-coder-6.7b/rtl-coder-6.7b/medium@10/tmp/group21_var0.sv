// Test nmos inverter using function calls
module tst_nm_in();
  reg in; wire out;
  NMOSinv nmv(out,in); // Instantiate NMOS inverter
  initial
    in =1'b1; // Start with input high -> output low
  always
  initial
  $monitor($time, " in = %b, output = %b ",in,out);
  initial #15 $stop; // Stop simulation
  // Add a case statement to call a function based on the input
  always @(in)
    case(in)
    1'b0 : out = nm_func2(in); // Call function for in = 0
    1'b1 : out = nm_func1(in); // Call function for in = 1
  endcase
  // Function 1 (invert in)
  function [1:0] nm_func1 ( in );
  nm_func1 = {~in, in};
  endfunction
  // Function 2 (return in as is)
  function [1:0] nm_func2 ( in );
  nm_func2 = {in, ~in};
  endfunction
endmodule
### Test Bench:
module tb_nm_in;
  reg in;           // Input for DUT
  wire out;         // Output of DUT
  reg[1:0] in_arr;  // Temporary input variable
  reg[1:0] out_arr; // Temporary output variable
  NMOSinv nmv(out,in); // Instantiate DUT
  initial
    in =1'b1; // Start with input high -> output low
  // Test DUT with a for loop
  initial
  begin
  for (in_arr = 2'b00; in_arr <= 2'b11; in_arr = in_arr + 1)
    begin
    #10;
    out_arr = {~in_arr[0], in_arr[1]};
    $display("Time = %0d ps: in = %b, out = %b",
    $time, in_arr, out_arr);
    end
  #15 $fin