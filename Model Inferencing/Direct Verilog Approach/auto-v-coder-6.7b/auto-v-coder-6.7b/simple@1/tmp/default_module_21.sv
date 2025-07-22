``` verilog
class test;
rand bit x1, x2, x3, x4;
bit f, g, h;

function void do_randomize();
  repeat(100) begin
    this.randomize();
  end
endfunction : do_randomize

function void compute_outputs();
  g = (x1 & x3) | (x2 & x4);
  h = (x1 | x3) & (x2 | x4);
  f = g | h;
endfunction : compute_outputs

function string convert2string();
  return $sformatf("x1=%b, x2=%b, x3=%b, x4=%b ||| f=%b, g=%b, h=%b", x1, x2, x3, x4, f, g, h);
endfunction : convert2string
endclass : test

module example4_tb;

test test_obj = new();

initial begin 
  test_obj.do_randomize();
  test_obj.compute_outputs();
  $display("%s", test_obj.convert2string());
end
endmodule
```
In the above code, we have created a `test` class that has rand variables `x1`, `x2`, `x3`, `x4`. We also included functions for randomizing the variables, computing the outputs and printing them. The module `example4_tb` creates an instance of `test` and calls the required functions to test the randomized and computed outputs.

This should give you a basic idea of how you can use Verilog classes and methods for more complex testing of Verilog code. Also, please note that Verilog testbenches are much more limited and are used for testing basic functionality. For complex behavioral verification, you would typically use more advanced tools such as modelsim, etc. Also, please ensure that your Verilog design is capable of accepting the randomized inputs. 

Also, this is a simple example, and does not cover edge cases or advanced Verilog features. You might want to use a more advanced structure for your testbench or testcases including constraints. If you're not familiar with Verilog classes, you might want to learn more about them or start with a simpler example. For randomization in Verilog, you can check the IEEE 1800-2017 standard or the Verilog Random Function.