module ha_8(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    (a, b *> s) = dl1;
    (a, b *> ca) = dl2;
  endspecify
  xor (s,a,b);
  and (ca,a,b);
endmodule
### Expected Behaviour:
No change in behaviour of the testbench.
### Actual Behaviour: 
a 4D packed logic array variable is inside a range list using array slice expressions.
### Comments:
The specparam dl1 is defined as 1 ns delay. The specparam dl2 is defined as dl1 + 1 ns delay. The path delay is assigned to the 4D packed array variable by using the dl1 and dl2 specparams. The testbench contains a 4D packed logic array variable which is inside a range list using slice expressions.
The expected and actual results are not the same. The testbench fails to run.
### Screenshots:
![Image](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/Vivado/Images/Screenshot%20from%202020-06-05%2014-15-32.png)
![Image](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/Vivado/Images/Screenshot%20from%202020-06-05%2014-16-03.png)
![Image](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/Vivado/Images/Screenshot%20from%202020-06-05%2014-22-11.png)
![Image](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/Vivado/Images/Screenshot%20from%202020-06-05%2014-22-50.png)
# Verilog Design s Notes

## Basics

-   [Basics](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/Basics/Basics.md)

## Basics of Verilog

-   [Basics of Verilog - Part 1](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/Basics%20of%20Verilog/Basics%20of%20Verilog%20-%20Part%201.md)
-   [Basics of Verilog - Part 2](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/Basics%20of%20Verilog/Basics%20of%20Verilog%20-%20Part%202.md)
-   [Basics of Verilog - Part 3](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/Basics%20of%20Verilog/Basics%20of%20Verilog%20-%20Part%203.md)
-   [Basics of Verilog - Part 4](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/Basics%20of%20Verilog/Basics%20of%20Verilog%20-%20Part%204.md)
-   [Basics of Verilog - Part 5](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/Basics%20of%20Verilog/Basics%20of%20Verilog%20-%20Part%205.md)
-   [Basics of Verilog - Part 6](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/Basics%20of%20Verilog/Basics%20of%20Verilog%20-%20Part%206.md)
-   [Basics of Verilog - Part 7](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/Basics%20of%20Verilog/Basics%20of%20Verilog%20-%20Part%207.md)
-   [Basics of Verilog - Part 8](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/Basics%20of%20Verilog/Basics%20of%20Verilog%20-%20Part%208.md)

## FPGA

-   [FPGA](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/FPGA/FPGA.md)
-   [FPGA Tutorial 0](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/FPGA/FPGA%20Tutorial%200.md)
-   [FPGA Tutorial 1](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/FPGA/FPGA%20Tutorial%201.md)
-   [FPGA Tutorial 2](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/FPGA/FPGA%20Tutorial%202.md)
-   [FPGA Tutorial 3](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/FPGA/FPGA%20Tutorial%203.md)
-   [FPGA Tutorial 4](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/FPGA/FPGA%20Tutorial%204.md)
-   [FPGA Tutorial 5](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/FPGA/FPGA%20Tutorial%205.md)
-   [FPGA Tutorial 6](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/FPGA/FPGA%20Tutorial%206.md)
-   [FPGA Tutorial 7](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/FPGA/FPGA%20Tutorial%207.md)
-   [FPGA Tutorial 8](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/FPGA/FPGA%20Tutorial%208.md)
-   [FPGA Tutorial 9](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/FPGA/FPGA%20Tutorial%209.md)
-   [FPGA Tutorial 10](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/FPGA/FPGA%20Tutorial%2010.md)
-   [FPGA Tutorial 11](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/FPGA/FPGA%20Tutorial%2011.md)
-   [FPGA Tutorial 12](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/FPGA/FPGA%20Tutorial%2012.md)
-   [FPGA Tutorial 13](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/FPGA/FPGA%20Tutorial%2013.md)
-   [FPGA Tutorial 14](https://github.com/dineshbharathi4/Verilog-Design-s-Notes/blob/master/