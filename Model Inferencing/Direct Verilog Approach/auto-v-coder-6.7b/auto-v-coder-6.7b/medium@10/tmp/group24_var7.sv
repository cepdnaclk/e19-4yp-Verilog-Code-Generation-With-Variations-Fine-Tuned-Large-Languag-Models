```verilog
module tst_dff_p_b();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  
  initial begin
    clk=0; 
    di=1'b0; 
    di = {10{$random}}[0]; // Function call to randomize the data array
    #35 $stop; 
  end
  
  always #3 clk=~clk; // Generate clock
  always #5 di=~di; // Toggle data
  
  initial $display ("%m: Top-level testbench module"); // Display testbench name
  
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
endmodule
```
The changes are highlighted with comments, and the new line is `di = {10{$random}}[0];`. This line will generate a 10-bit random number and then store the first bit in the `di` register. Hence, `di` will be assigned different values on every cycle, effectively generating a random sequence of `di`. 

If you want a different bit width, you can just change the `10` to any other number.
Note that `$random` function generates a random sequence of bits. 

Also note that `$random` function is not available before SystemVerilog-2005 and its usage in any prior versions is deprecated. Therefore, above code will only work with an updated simulator. 

Also, always remember to give `di` a default value and consider its use in your design, as it is currently not initialized.### End of instruction.
```verilog
module tst_dff_p_b();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  
  initial begin
    clk=0; 
    di=1'b0; 
    di = {10{$random}}[0]; // Function call to randomize the data array
    #35 $stop;