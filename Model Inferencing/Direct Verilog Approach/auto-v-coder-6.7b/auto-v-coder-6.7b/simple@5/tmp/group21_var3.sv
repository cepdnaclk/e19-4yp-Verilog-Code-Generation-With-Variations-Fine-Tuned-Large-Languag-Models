```verilog
interface example4_if (input x1, x2, x3, x4, output f, g, h);
   modport dut (input x1, x2, x3, x4, output f, g, h);
endinterface

module example4(example4_if.dut);
   always_comb begin
      g = (x1 & x3) | (x2 & x4);
      h = (x1 | x3) & (x2 | x4);
      f = g | h;
   end
endmodule
```
This code provides an interface to the module, allowing you to randomize the inputs and observe the outputs. 

```verilog
module example4_test;
   reg x1, x2, x3, x4;
   wire f, g, h;

   example4_if inst_example4(.x1,.x2,.x3,.x4,.f,.g,.h);
   example4 dut(inst_example4.dut);

   initial begin
      #100;
      $display("f = %b, g = %b, h = %b", f, g, h);
   end

   initial begin
      #100;
      $finish;
   end
endmodule
```
In the testbench, we are just displaying the outputs after 100ns.

Remember to compile and run both modules to observe the behavior.
### Testing with Randomization:
```verilog
module example4_random_test;
   reg x1, x2, x3, x4;
   wire f, g, h;
   example4_if inst_example4(.x1,.x2,.x3,.x4,.f,.g,.h);
   example4 dut(inst_example4.dut);

   initial begin
      x1 = 0; x2 = 0; x3 = 0; x4 = 0;
      #100;
      $display("f = %b, g = %b, h = %b", f, g, h);

      #100;
      $finish;
   end