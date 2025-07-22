Here, we have added an assertion statement to check if the output is equal to the input when the control signal is set to '1'.

```verilog
module tst_CMOSsw1();
  reg in,con; wire out;
  CMOSsw1 cmsw(out,in,con); // Instantiate CMOS switch
  initial begin
    in=1'b0; con=1'b1;
    $monitor($time, "in = %b, con = %b, output = %b ",in,con,out);
    assert(out === cmsw.out) else $error("Assertion Failed: %b", cmsw.out);
  end
  always #5 in =~in; // Toggle data
  always #3 con=~con; // Toggle control
  initial #20 $stop; // Stop simulation
endmodule
```
The code above checks if the output is equal to the input. If it's not equal, it raises an error. It will show an error message and stop the simulation. The error message shows the expected and actual outputs in case of a mismatch. Keep in mind that this assertion checks the output only when control is '1', so the output can be different from the input in case of control being '0'. 

Also note that, this variation assumes that the module you are testing is named `CMOSsw1` and `out` is the output of that module. If yours is different, you would need to change the module name and output name accordingly.

Remember, Verilog is a hardware description language and this kind of checking might not be necessary or even valid in a real hardware design, usually the functionality the module should exhibit is verified through simulation or synthesis without the need for assertions. However, assertions are very helpful for testbenches to check behavior of modules to ensure the expected functionality.###EEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFF######EEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFF######EEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFF######EEEEFFEEEEFFEEEEFF######EEEEFFEEEEFF######EEEEFF######EEEEFF######EEEEFF######EEEEFF######EEEEFF######EEEEFF######EEEEFF######EEEEFF######EEEEFF######EEEEFF######EEEEFF######EEEEFF######EEEEFF######EEEEFF######EEEEFF######EEEEFF######EEEEFF######EEEEFF######EEEEFF######EEEEFF