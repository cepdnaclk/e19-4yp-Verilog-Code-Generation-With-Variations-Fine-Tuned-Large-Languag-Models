module tstha_9();
  reg a,b; wire s,ca;
  packed type_ha_9 {input a; input b; output s; output ca};
  ha_9 hh(s,a,b); // Instantiate HA with rise/fall path delays
  initial begin a=0;b=0; end
  always @* begin #5 a=1;b=0; #5 a=0;b=1; #5 a=1;b=1; #5 a=0;b=0; end
  initial $monitor($time, " a = %b, b = %b,out carry = %b, outsum = %b ",a,b,ca,s);
  initial #30 $stop;
endmodule
```
/docs/rtl_resources/README.md
# RTL Resources
- [RTL Resources](#rtl-resources)
    - [Verilog](#verilog)
    - [Surelog](#surelog)
    - [UVM](#uvm)
    - [Verification](#verification)
    - [Tools](#tools)
    - [Slang Tools](#slang-tools)

## Verilog
#### The Basics:
- [Verilog Basics](https://www.asic-world.com/verilog/verilog_basics.html)
- [Verilog Basics](https://www.tutorialspoint.com/verilog/index.htm)
- [Verilog Basics](https://www.electronics-tutorials.ws/logic/logic.html)
- [HDL Design Best Practices](http://www.asic-world.com/verilog/verilog_best_practices.html)
- [Verilog HDL](http://www.asic-world.com/verilog/verilog_basics.html)
- [Verilog HDL](https://web.stanford.edu/class/ee162/handouts/verilog.pdf)
- [Verilog HDL](https://www.electronics-tutorials.ws/synthesis/synthesis.html)
- [Verilog HDL](https://www.electronics-tutorials.ws/verilog/verilog-syntax.html)
- [Verilog HDL](https://www.electronics-tutorials.ws/verilog/verilog-operators.html)
- [Verilog HDL](https://www.electronics-tutorials.ws/verilog/verilog-keywords.html)
- [Verilog HDL](https://www.electronics-tutorials.ws/verilog/verilog-data-types.html)
- [Verilog HDL](https://www.electronics-tutorials.ws/verilog/verilog-primitives.html)
- [Verilog HDL](https://www.electronics-tutorials.ws/verilog/verilog-functions.html)
- [Verilog HDL](https://www.electronics-tutorials.ws/verilog/verilog-loops.html)
- [Verilog HDL](https://www.electronics-tutorials.ws/verilog/verilog-flow-control.html)
- [Verilog HDL](https://www.electronics-tutorials.ws/verilog/verilog-conditionals.html)
- [Verilog HDL](https://www.electronics-tutorials.ws/verilog/verilog-initial.html)
- [Verilog HDL](https://www.electronics-tutorials.ws/verilog/verilog-module.html)
- [Verilog HDL](https://www.electronics-tutorials.ws/verilog/verilog-assignment.html)
- [Verilog HDL](https://www.electronics-tutorials.ws/verilog/verilog-netlist.html)
- [Verilog HDL](https://www.electronics-tutorials.ws/verilog/verilog-functions.html)
- [Verilog HDL](https://www.electronics-tutorials.ws/verilog/verilog-functions.html)
- [Verilog HDL](https://www.electronics-tutorials.ws/verilog/verilog-functions.html)
- [Verilog HDL](https://www.electronics-tutorials.ws/verilog/verilog-functions.html)
- [Verilog HDL](https://www.electronics-tutorials.ws/verilog/verilog-functions.html)
- [Verilog HDL](https://www.electronics-tutorials.ws/verilog/verilog-functions.html)
- [Verilog HDL](https://www.electronics-tutorials.ws/verilog/verilog-functions.html)

## Surelog
#### The Basics:
- [Surelog Basics](https://github.com/alainmarcel/Surelog/wiki/Surelog-Basics)
- [Surelog Basics](http://www.asic-world.com/surelog/surelog_basics.html)
- [Surelog Basics](http://www.asic-world.com/surelog/surelog_best_practices.html)
- [Surelog Basics](https://www.tutorialspoint.com/surelog/index.htm)
- [Surelog Basics](https://www.electronics-tutorials.ws/design/synthesis.html)
- [Surelog Basics](https://www.electronics-tutorials.ws/verilog/verilog_basics.html)
- [Surelog Basics](https://www.electronics-tutorials.ws/verilog/verilog-syntax.html)
- [Surelog Basics](https://www.electronics-tutorials.ws/verilog/verilog-operators.html)
- [Surelog Basics](https://www.electronics-tutorials.ws/verilog/verilog-keywords.html)
- [Surelog Basics](https://www.electronics-tutorials.ws/verilog/verilog-data-types.html)
- [Surelog Basics](https://www.electronics-tutorials.ws/verilog/verilog-primitives.html)
- [Surelog Basics](https://www.electronics-tutorials.ws/verilog/verilog-functions.html)
- [Surelog Basics](https://www.electronics-tutorials.ws/verilog/verilog-loops.html)
- [Surelog Basics](https://www.electronics-tutorials.ws/verilog/verilog-flow-control.html)
- [Surelog Basics](https://www.electronics-tutorials.ws/verilog/verilog-conditionals.html)
- [Surelog Basics](https://www.electronics-tutorials.ws/verilog/verilog-initial.html)
- [Surelog Basics](https://www.electronics-tutorials.ws/verilog/verilog-module.html)
- [Surelog Basics](https://www.electronics-tutorials.ws/verilog/verilog-assignment.html)
- [Surelog Basics](https://www.electronics-tutorials.ws/verilog/verilog-netlist.html)
- [Surelog Basics](https://www.electronics-tutorials.ws/verilog/verilog-functions.html)
- [Surelog Basics](https://www.electronics-tutorials.ws/verilog/verilog-functions.html)
- [Surelog Basics](https://www.electronics-tutorials.ws/verilog/verilog-functions.html)
- [Surelog Basics](https://www.electronics-tutorials.ws/verilog/verilog-functions.html)
- [Surelog Basics](https://www.electronics-tutorials.ws/verilog/verilog-functions.html)
- [Surelog Basics](https://www.electronics-tutorials.ws/verilog/verilog-functions.html)
- [Surelog Basics](https://www.electronics-tutorials.ws/verilog/verilog-functions.html)

#### Verilog HDL
- [Verilog HDL](https://github.com/alainmarcel/Surelog/wiki/Verilog-HDL)
- [Verilog HDL](https://github.com/alainmarcel/Surelog/wiki/Verilog-HDL)
- [Verilog HDL](https://github.com/alainmarcel/Surelog/wiki/Verilog-HDL)

#### UVM
- [UVM](https://github.com/alainmarcel/Surelog/wiki/UVM)
- [UVM](https://github.com/alainmarcel/Surelog/wiki/UVM)
- [UVM](https://github.com/alainmarcel/Surelog/wiki/UVM)
- [UVM](https://github.com/alainmarcel/Surelog/wiki/UVM)

#### Verification