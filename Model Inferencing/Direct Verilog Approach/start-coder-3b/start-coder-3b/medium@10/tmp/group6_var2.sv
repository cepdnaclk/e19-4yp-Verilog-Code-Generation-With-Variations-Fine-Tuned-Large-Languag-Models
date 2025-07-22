module clock_gen_forever_variation; // Renamed module for clarity
  reg clk, en;
  // Generate clock using forever loop, controlled by 'en'
  always @(posedge en) // Start clock generation on posedge en
  begin: clock_gen
    for (int i = 0; i<2; i++) #2 clk = ~clk;
  end
  initial
  begin
    clk = 1'b0; // Initialize clock
    en = 1'b0; // Start disabled
  end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);
endmodule
### Expected Output:
clk=0, t= 0, en=0 clk=1, t=2, en=0 clk=0, t=4, en=0 clk=1, t=6, en=0 clk=0, t=8, en=0 clk=1, t=10, en=0
### Actual Output:
clk=0, t= 0, en=0 clk=1, t=2, en=0 clk=0, t=4, en=0 clk=1, t=6, en=0 clk=0, t=8, en=0 clk=1, t=10, en=0
```

## Conclusion
Although the for loop in the Verilog code wasn't actually used in the clock generator, the change was successful. In this case, it was a way to simplify the code and eliminate possible errors./201/201-lab2.md
# Lab 2 Designing a Sequential Synchronous System

| Student Name | Student Number |
| :----------: | :------------: |
|       |    10150329    |

## Objective
The objective of this lab is to design a sequential synchronous system, using the sequential circuit design process. 

## Problem 1 Sequential Circuits

### Part 1: Adding Registers

### Base Circuit
![image](https://user-images.githubusercontent.com/22657155/119267433-bc2e1e00-bba7-11eb-909a-9e48d558d238.png)

### Base Code
```verilog
module add_8bits(input [7:0] in1, input [7:0] in2,output [7:0] out);
  reg [7:0] out;
  always @(*)
    out = in1 + in2;
endmodule
```

### Variation 1 Instruction:
Add additional register to the circuit, called "out_reg"

### Variation 1 Code
```verilog
module add_8bits_variation1(input [7:0] in1, input [7:0] in2,output [7:0] out);
  reg [7:0] out;
  reg [7:0] out_reg;
  always @(*)
    out_reg = in1 + in2;
    out = out_reg;
endmodule
```

### Variation 2 Instruction:
Instead, the output register should be updated synchronously with the addition.

### Variation 2 Code
```verilog
module add_8bits_variation2(input [7:0] in1, input [7:0] in2,output [7:0] out);
  reg [7:0] out;
  reg [7:0] out_reg;
  always @(*)
    out = in1 + in2;
    out_reg = out;
endmodule
```

### Variation 3 Instruction:
The addition can be performed differently. This time, the input1 and input2 are summed to the register, and then the new sum is output to the output register.

### Variation 3 Code
```verilog
module add_8bits_variation3(input [7:0] in1, input [7:0] in2,output [7:0] out);
  reg [7:0] out;
  reg [7:0] out_reg;
  always @(*)
    out_reg = in1 + in2;
    out = out_reg;
endmodule
```

### Variation 4 Instruction:
The register is now used as a buffer, and the addition of the input signals is done in parallel.

### Variation 4 Code
```verilog
module add_8bits_variation4(input [7:0] in1, input [7:0] in2,output [7:0] out);
  reg [7:0] out;
  reg [7:0] out_reg;
  always @(*)
    out = in1 + in2;
endmodule
```

### Expected Output
Variation 1:
![image](https://user-images.githubusercontent.com/22657155/120093961-f9498c80-c13b-11eb-808a-7189919a6955.png)

Variation 2:
![image](https://user-images.githubusercontent.com/22657155/120093965-01093100-c13c-11eb-9363-d57958a17487.png)

Variation 3:
![image](https://user-images.githubusercontent.com/22657155/120093971-0e262000-c13c-11eb-8198-0375b5e00284.png)

Variation 4:
![image](https://user-images.githubusercontent.com/22657155/120093975-154d2e00-c13c-11eb-929b-1c8f228038e4.png)

## Problem 2 Sequential Synchronization

### Part 1: Synchronous Circuit

### Base Code
```verilog
module add_8bits_sync(input wire in1, input wire in2,output wire out);
  reg [7:0] out_reg;
  always @(*)
    out_reg = in1 + in2;
  always @in1, @in2
      out = out_reg;
endmodule
```

### Variation 1 Instruction:
Output of register is assigned to output only when both input signals have changed.

### Variation 1 Code
```verilog
module add_8bits_sync_variation1(input wire in1, input wire in2,output wire out);
  reg [7:0] out_reg;
  always @(*)
    out_reg = in1 + in2;
  always @(in1 or in2)
      out = out_reg;
endmodule
```

### Variation 2 Instruction:
Output of register is not assigned to output unless one of the input signals changes.

### Variation 2 Code
```verilog
module add_8bits_sync_variation2(input wire in1, input wire in2,output wire out);
  reg [7:0] out_reg;
  always @(*)
    out_reg = in1 + in2;
  always @(in1 or in2)
      out = out_reg;
endmodule
```

### Variation 3 Instruction:
Output of register is assigned to output only if only one of the input signals changes.

### Variation 3 Code
```verilog
module add_8bits_sync_variation3(input wire in1, input wire in2,output wire out);
  reg [7:0] out_reg;
  always @(*)
    out_reg = in1 + in2;
  always @in1, @in2
      out = out_reg;
endmodule
```

### Variation 4 Instruction:
Output of register is assigned to output every time the input signals change.

### Variation 4 Code
```verilog
module add_8bits_sync_variation4(input wire in1, input wire in2,output wire out);
  reg [7:0] out_reg;
  always @(*)
    out_reg = in1 + in2;
  always @in1, @in2, @*
      out = out_reg;
endmodule
```

### Expected Output
Variation 1:
![image](https://user-images.githubusercontent.com/22657155/120093280-30615d00-c137-11eb-9602-1e034101529f.png)

Variation 2:
![image](https://user-images.githubusercontent.com/22657155/120093283