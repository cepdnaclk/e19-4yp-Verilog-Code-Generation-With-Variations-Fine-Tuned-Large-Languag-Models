```
module tst_ctr_wt;
reg clk,En;
reg[3:0]N;
wire[3:0]a;
// Variation instruction
generate
for (int i=0; i<16; i=i+1)
begin
N[4'b0001:8'b1111]=4'b1111-i;
end
endgenerate
ctr_wt c1(a,clk,N,En);
initial
begin
clk=0; N=4'b1111; // Set limit to 15
En=1'b0; // Start disabled
end
always
initial #35 $stop; // Stop simulation
initial $monitor($time,"clk=%b, En=%b, N=%d, a=%d",clk,En,N,a); // Corrected format specifiers
endmodule
```
### Observations:
* Generate blocks are used for generating code for a loop with varying number of instances.
* An escaped name is used to declare the variable `N` in the generate block.
* `inside` operator is used to select the range for which the generate block is executed.
* `$monitor` is used to display the values of all the signals at a particular instant in time.
/Labs/Lab04/README.md
## Lab 4

*Lab 4 is on Verilog and HDL synthesis*

This lab is based on the 2nd year lab on Digital Circuits & Designs.

The lab introduces some famous circuits and implements them using Verilog.

## Materials

* [Course Materials](https://github.com/cse2032/course-materials.git)
* [Verilog Reference](https://learning.edx.org/course/verilog-course/verilog/courseware/c7fb09e340d4482aa5f914b78c91534e/)
* [Verilog for Computer Architecture](https://www.cse.iitb.ac.in/~uday/VCA/ch14.pdf)
* [Verilog-A Reference Manual](https://en.wikibooks.org/wiki/Verilog/A_Reference_Manual)
* [Verilog HDL](https://www.eecs.wsu.edu/~schneidj/Verilog/VerilogHDL.pdf)

## Task

* Implement the following circuits
  * [AND](https://en.wikipedia.org/wiki/AND_gate)
  * [OR](https://en.wikipedia.org/wiki/OR_gate)
  * [NOT](https://en.wikipedia.org/wiki/NOT_gate)
  * [NAND](https://en.wikipedia.org/wiki/NAND_gate)
  * [NOR](https://en.wikipedia.org/wiki/NOR_gate)
  * [XOR](https://en.wikipedia.org/wiki/XOR_gate)
  * [XNOR](https://en.wikipedia.org/wiki/XNOR_gate)

## Guidelines

* Read the material carefully and try to implement each of them.
* Ask questions on the [classroom](https://classroom.github.com/a/mT_qJ9Q) and the [channel](https://gitter.im/cse2032-03/General)
* Use the references mentioned above.

## How to hand in

* [Submit your code](https://forms.gle/n37i2eN6mX5v5Z6w8) on [Gradescope](https://www.gradescope.com/courses/162215)

## Hints 

### AND

```
module and2(
    output Q,
    input A,
    input B);
  assign Q = A & B;
endmodule
```

### OR

```
module or2(
    output Q,
    input A,
    input B);
  assign Q = A | B;
endmodule
```

### NOT

```
module not1(
    output Q,
    input A);
  assign Q =!A;
endmodule
```
The **NOT** gate is a two input gate which takes an input 
```

### XNOR

```
module xnor2(
    output Q,
    output R,
    input A,
    input B);
  assign Q = ~A & ~B;
  assign R = ~A | ~B;
endmodule
```
and gives an output, the output depends only on the input.

### NAND

```
module nand2(
    output Q,
    input A,
    input B);
  assign Q = ~(A & B);
endmodule
```

### NOR

```
module nor2(
    output Q,
    input A,
    input B);
  assign Q = ~ (A | B);
endmodule
```

### XOR

```
module xor2(
    output Q,
    input A,
    input B);
  assign Q = A ^ B;
endmodule/labs/03/README.md
## Lab 03

*Lab 3 is on FSMs and logic design*

The lab introduces some famous logic circuits and designs them using Verilog.

## Materials

* [Course Materials](https://github.com/cse2032/course-materials.git)
* [Verilog Reference](https://learning.edx.org/course/verilog-course/verilog/courseware/c7fb09e340d4482aa5f914b78c91534e/)
* [Verilog for Computer Architecture](https://www.cse.iitb.ac.in/~uday/VCA/ch14.pdf)
* [Verilog-A Reference Manual](https://en.wikibooks.org/wiki/Verilog/A_Reference_Manual)
* [Verilog HDL](https://www.eecs.wsu.edu/~schneidj/Verilog/VerilogHDL.pdf)

## Task

* Implement the following circuits
  * [Counter](https://en.wikipedia.org/wiki/Counter) (16 bit)
  * [MUX](https://en.wikipedia.org/wiki/Multiplexer) (4:1)
  * [Decade Counter](https://en.wikipedia.org/wiki/Binary-coded_decimal)
  * [7 Segment Decoder](https://en.wikipedia.org/wiki/Seven-segment_display)
  * [Multiplexer](https://en.wikipedia.org/wiki/Multiplexer) (4:4)
  * [Adder](https://en.wikipedia.org/wiki/Adder_(electronics)) (4 bit)
    * [3-bit adder](https://en.wikipedia.org/wiki/Adder_(electronics)#3-bit_adder)
    * [4-bit adder](https://en.wikipedia.org/wiki/Adder_(electronics)#4-bit_adder)
    * [3-bit full adder](https://en.wikipedia.org/wiki/Adder_(electronics)#Full_adder)

## Guidelines

* Read the material carefully and try to implement each of them.
* Ask questions on the [classroom](https://classroom.github.com/a/mT_qJ9Q) and the [channel](https://gitter.im/cse2032-03/General)
* Use the references mentioned above.

## How to hand in

* [Submit your code](https://forms.gle/n37i2eN6mX5v5Z6w8) on [Gradescope](https://www.gradescope.com/courses/162215)

## Hints 

### Counter


<p align="center">
  <img src="https://github.com/cse2032/course-materials/blob/master/labs/lab03/ctr.png" alt="OR"/>
</p>

```
module tst_ctr(
    output Clk,
    output En,
    output Rst,
    output Count);

    reg Clk, En, Rst;
    wire Count;
    wire [15:0] Count_;

    ctr c1(Count, Clk, En, Rst);

    initial
    begin
        Clk = 0;
        En = 1'b0;
        Rst = 1'b0;
    end

    always
    initial
    begin
        Clk = Clk + 1'b1;
        $monitor($time, "Clk = %b, En = %b, Rst = %b, Count = %b", Clk, En, Rst, Count);
    end

endmodule
```

### MUX (4:1)

<p align="center">
  <img src="https://github.com/cse2032