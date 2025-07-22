```verilog
package SchedDelayA;
class A;
   reg a, b;
   function new();
      a = 0;
      b = 0;
   endfunction
   function void show();
      $display("a = %b, b = %b", a, b);
   endfunction
endclass
endpackage

module test;
import SchedDelayA::*;
A a;
A b;

initial begin
   a = new();
   b = new();
   a.b = 1;
   b.a = 1;
   a.show();
   b.show();
end
endmodule
```
In the above code, the "A" class is defined in a package "SchedDelayA". An instance of the class "A" is created and assigned to `a` and `b`. The class "A" contains a `b` input and `a` output. `a` and `b` are updated accordingly. The show function is used to display the state of `a` and `b`. 

The associative array concept is used in this code to handle class-based associative access. We've created instance of `A` class and stored it in a class handle `a` and `b`, then accessed the `a` and `b` instance using associative array with class instance as key. 

Please ensure that the file is saved with a.vhdl extension and then compiled and run on a capable simulator like ModelSim, Incisive or VCS. The results will be displayed on the command line.
Additionally, if the above code is to be run in an actual hardware, the Verilog constructs will need to be translated to VHDL and the design needs to be synthesized and uploaded to an actual FPGA to work. 

Remember that using class based Verilog-like constructs in hardware is not standard Verilog and may not be supported in all HDLs or simulators. This is more of a conceptual demonstration and may not work as expected in actual hardware design. 

Please remember that Verilog is primarily used for digital design and does not have the same support for object-oriented programming as higher-level languages like Python or Java. The code provided is not strictly equivalent to a hardware design and