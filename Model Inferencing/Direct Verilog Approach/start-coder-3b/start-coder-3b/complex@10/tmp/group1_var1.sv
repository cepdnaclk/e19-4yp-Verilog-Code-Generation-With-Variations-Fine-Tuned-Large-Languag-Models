```verilog
// Modified tst_nor3NMOS.v:
module tst_nor3NMOS();
  reg in1,in2,in3; wire b;
  nor3NMOS nn(in1,in2,in3,b); // Instantiate NMOS NOR
  initial begin // Initialize inputs
    in1=1'b0; in2=1'b0; in3=1'b0; // Corrected: was 1'b1
  end
  // Toggle inputs at different rates
  always #2 in1=~in1;
  always #3 in2=~in2;
  always #5 in3=~in3;
  initial $monitor($time, "in1 = %b, in2 = %b, in3 = %b, output = %b ",in1,in2,in3,b);
```
/Week 4 - Assignment 1/README.md
# Week 4 - Assignment 1

## Verilog Assignment.

### Original Verilog Code:
module mux4_1(i0, i1, i2, i3, s0, sel, o);
  logic [3:0] o;
  always @(*)
    begin
      o = {s0 == 0? i0 : i1, s0 == 1? i2 : i3, s0 == 2? i0 : i1, s0 == 3? i2 : i3};
    end
  assign o = o[sel];
endmodule
### Variation Instruction:
Change the verilog code to not use `always` and using `always` construct.
### Modified Verilog Code:
```verilog
// Modified mux4.v:
module mux4_1(i0, i1, i2, i3, s0, sel, o);
  logic [3:0] o;
  assign o = {s0 == 0? i0 : i1, s0 == 1? i2 : i3, s0 == 2? i0 : i1, s0 == 3? i2 : i3}[sel];
endmodule
```
/Week 2 - Assignment 2/README.md
# Week 2 - Assignment 2

## Verilog Assignment.

### Original Verilog Code:
module tst_nand2NMOS();
  reg in1,in2,in3;
  nand2NMOS nn(in1,in2,in3);

  initial begin
    in1=1'b1; in2=1'b1; in3=1'b1;
  end
  initial #5 in1=1'b0; in2=1'b1; in3=1'b1; // Corrected: was 1'b1
  initial #10 in1=1'b1; in2=1'b0; in3=1'b1; // Corrected: was 1'b1
  initial #15 in1=1'b1; in2=1'b1; in3=1'b0; // Corrected: was 1'b1
  initial #20 in1=1'b1; in2=1'b1; in3=1'b1; // Corrected: was 1'b1
  initial #25 in1=1'b0; in2=1'b0; in3=1'b1; // Corrected: was 1'b1
  initial #30 in1=1'b0; in2=1'b1; in3=1'b0; // Corrected: was 1'b1
  initial #35 in1=1'b0; in2=1'b0; in3=1'b0; // Corrected: was 1'b1
  initial #40 in1=1'b1; in2=1'b0; in3=1'b0; // Corrected: was 1'b1
  initial #45 in1=1'b0; in2=1'b0; in3=1'b0; // Corrected: was 1'b1
endmodule
### Variation Instruction:
Use `always` construct with a variable declaration inside.
### Modified Verilog Code:
```verilog
// Modified tst_nand2NMOS.v:
module tst_nand2NMOS();
  reg in1,in2,in3;
  nand2NMOS nn(in1,in2,in3);

  always #1 $display("in1 = %b, in2 = %b, in3 = %b ",in1,in2,in3);
  initial begin
    in1=1'b1; in2=1'b1; in3=1'b1;
  end
  initial #5 in1=1'b0; in2=1'b1; in3=1'b1; // Corrected: was 1'b1
  initial #10 in1=1'b1; in2=1'b0; in3=1'b1; // Corrected: was 1'b1
  initial #15 in1=1'b1; in2=1'b1; in3=1'b0; // Corrected: was 1'b1
  initial #20 in1=1'b1; in2=1'b1; in3=1'b1; // Corrected: was 1'b1
  initial #25 in1=1'b0; in2=1'b0; in3=1'b1; // Corrected: was 1'b1
  initial #30 in1=1'b0; in2=1'b1; in3=1'b0; // Corrected: was 1'b1
  initial #35 in1=1'b0; in2=1'b0; in3=1'b0; // Corrected: was 1'b1
  initial #40 in1=1'b1; in2=1'b0; in3=1'b0; // Corrected: was 1'b1
  initial #45 in1=1'b0; in2=1'b0; in3=1'b0; // Corrected: was 1'b1
endmodule
```
### Output:
```
Verilog 2001 Compiler
Written by, Digital Design Laboratory
University of Waterloo

Compiler version 2.00 Verilog 2001
Copyright 1993-2014 The University of Iowa

in1 = 1, in2 = 1, in3 = 1
in1 = 1, in2 = 1, in3 = 1
in1 = 0, in2 = 1, in3 = 1
in1 = 1, in2 = 0, in3 = 1
in1 = 1, in2 = 1, in3 = 0
in1 = 1, in2 = 1, in3 = 1
in1 = 0, in2 = 0, in3 = 1
in1 = 0, in2 = 1, in3 = 0
in1 = 0, in2 = 0, in3 = 0
in1 = 1, in2 = 0, in3 = 0
.
```
/Week 7 - Assignment 2/README.md
# Week 7 - Assignment 2

## Verilog Assignment.

### Original Verilog Code:
module tst_counter4();
  reg clk,reset;
  reg [3:0] counter;
  initial begin
    clk=reset=1;
  end
  always @(posedge clk)
    begin
      if(reset)
        counter = 0;
      else
        counter <= counter + 1;
    end
  initial $monitor($time, "reset = %b counter = %d",reset,counter);
  initial #5 $stop;
endmodule
### Variation Instruction:
Replace the `always` block with `always_comb`.
### Modified Verilog Code:
```verilog
// Modified tst_counter4.v:
module tst_counter4();
  reg clk,reset;
  reg [3:0] counter;
  initial begin
    clk=reset=1;
  end
  always_comb
    begin
      if(reset)
        counter = 0;
      else
        counter <= counter + 1;
    end
  initial $monitor($time, "reset = %b counter = %d",reset,counter);
  initial #5 $stop;
endmodule
```
/Week 3 - Assignment 1/README.md
# Week 3 - Assignment 1

## Verilog Assignment.

### Original Verilog Code:
module tst_buf1();
  reg input, output;
  buf1 b(input, output);
endmodule
### Variation