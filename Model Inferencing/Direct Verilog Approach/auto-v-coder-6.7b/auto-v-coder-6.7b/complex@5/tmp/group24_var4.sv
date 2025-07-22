```verilog
module testbench;
  parameter pkg::consts[pkg::XMR] = '{1,2,3,4,5,6,7,8,9,0}
  reg clk,en,int;
  wire [3:0] BCD_in;
  wire valid;
  xmr_decoder dut(clk,en,int,BCD_in,valid);

  initial
  begin
    int=1'b0;
    clk=1'b0;
    en=1'b0;
  end

  always #2 clk=~clk; // Generate clock

  initial $monitor("clk=%b, t=%0d, en=%b, int=%b, valid=%b, BCD_in=%h", clk,$time,en,int,valid,BCD_in);
  
  initial #40 $stop; // Stop simulation

  initial begin
    #100 BCD_in = pkg::consts[pkg::XMR];
    #200 BCD_in = pkg::consts[pkg::XMR - 1];
    #300 BCD_in = pkg::consts[pkg::XMR - 2];
  end
endmodule
```

Remember to replace `pkg::XMR` with your actual XMR value and `pkg::consts` with your array of constants.

This code creates a testbench with an array of constants to test with, it selects the last 3 elements of the array to test the `BCD_in` using XMR. This code assumes that you have a module named `xmr_decoder` that corresponds to the microprocessor module you mentioned. The `xmr_decoder` module should be instantiated with the same inputs as the `testbench` module.

Please adjust `XMR` and `pkg::consts` to your actual requirements.

This code will monitor the output signals of the `xmr_decoder` module at every clock cycle, and every 100, 200, and 300 simulation time units, it will select the last 3 elements of the array to test the