Here is the code after the modification:

```verilog
module tst_CMOSsw1();
  reg in,con; wire out;
  CMOSsw1 cmsw(out,in,con); // Instantiate CMOS switch
  initial begin 
    in=1'b0; con=1'b1; 
  end // Start enabled
  always #5 in =~in; // Toggle data
  always #3 con=~con; // Toggle control
  initial $monitor($time, "in = %b, con = %b, output = %b ",in,con,out);
  initial #20 $stop; // Stop simulation
endmodule

module CMOSsw1(out, in, con);
  input in, con;
  output reg out;
  
  always @(con or in) begin
    if(con) begin
      out = in;
    end else begin
      out = ~in;
    end
  end
endmodule
```

In this code, the `CMOSsw1` module has been modified. The `CMOSsw1` module now uses the same `always` block as before. The `always` block is triggered whenever `in` or `con` changes. The inside of the block checks the value of `con`. If `con` is `1`, the output `out` is set to `in`. If `con` is `0`, `out` is set to `~in`. The output `out` is then updated when the simulation time advances. This modification is designed to simulate a CMOS switch. 
  
Please replace "tst_CMOSsw1" with your own module name. This module is named as "tst_CMOSsw1" for testing purposes.###EEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFFEEEEFF