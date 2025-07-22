```
struct data_component_struct{
  always_comb begin
    DataOut = DataIn;
  end
  rand begin
    int<8> randData;
    randData = rand? randData:rand.next;
  end
};
/doc/verilog_style.md
## Verilog style guide

### General style

- Use tabs for indentation (never spaces), although spaces are still allowed in certain locations.
- Line wrapping is only necessary when the code would otherwise exceed the 80 character limit, and in those cases the maximum line length is 100 characters.
- Line length should be determined by the number of characters that can fit into the 80-character limit. Longer lines are usually harder to read.

### Code blocks

- All code should be contained within parentheses, unless they are not necessary to indicate a block.
- Use a single, blank line before a new block begins. Make sure that this is the only line and is not mixed up with a different block.
- If a code block spans multiple lines, indent it to 2 or more tabs.
- If a code block is empty, add a comment to explain why it is empty.

### File names

- All filenames should be lower case and have the extension "v".
- If there are multiple files in the same directory, they should be ordered alphabetically.

### Comments

- Start every comment block with a line starting with '//' and a single space.
- Start every comment within a block with two slashes, and comment text should be indented one space from the line starting with '//'.
- If a line begins with a comment, it should not be indented to be parallel with the line starting with '//'.

### Naming conventions

- Verilog uses the same naming conventions as C++ and Java.
- Module names must be all uppercase.
- Local variable names and parameter names must be all lowercase.
- Variables and signals must be named with 2 or more lowercase letters.

```
input a0;
input [1:0] a1;
input  a2, a3;
input   a4, a5;
input  a6,  a7, a8;
input  a9;
input   x_a10,    x_a11, x_a12;
input  x_a13;
input   x_x_x_a14;  x_x_x_    a15;
input  x_x_x_        x_x_x_x_a16;
input   b0, b1, b2;
input   [0:0]   b3;
input   [1:0]   b4;
input   [0]     b5;
input   [1]     b6;
input   [2]     b7;
input  [3]     b8;
input   [3:0]   b9;
input   [7]     b10;
input   [7:0]   b11;
input   [3:0]   [0:0]   b12;
input  [3:0]   [1:0]   b13;
input   [1:0]   [1:0]   b14;
input  [1:0]   [3:0]   b15;
input   [1:0]   [3:0]   [0:0]   b16;
input  [1:0]   [3:0]   [1:0]   b17;
input   x_x_x_    x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_b18;
input  x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_b19;
input   x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_b20;
input  x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_b21;
```

You will notice that the variable names are in alphabetical order. This is not technically necessary, but it is very important to have consistent naming. The "x" variable names are used as placeholders for long variable names.

**The exception to all of the above is the testbench file, which should be named "testbench.v".**

### Testbench file

- The file should contain a "module main" with a single input "clock" and a single output "done".
- The file should contain a "module test" to contain all of the test buses.
- The file should contain a "module testbench" to contain all the verilog code that is necessary to run the tests.

### Module names

- Module names that are less than 10 characters long should use snake-case. This includes any instance of a module within another module.
- Module names that are longer than 10 characters long should use camel case.

### Schematic symbols

- Use the following schematic symbols:

```
input:  I 
output: O 
inout:  IO 
reg:    R 
wire:   W 
logic:  L
```

- The input/output schematic symbol should only be used when it is clear that the input/output is a signal or variable being used by the module.
- If the input/output is being used to pass data to/from a register, then the input/output schematic symbol should be in the opposite direction of the actual signal or variable being used.

### Module I/O and Wire

- All of the wires, including inputs and outputs, should be declared in the module header.
- The use of wires should be limited. If a variable is declared as a wire, it should be assigned a value within the module's always block.
- Wires that are not assigned should not be declared.

### Module headers

- The signal declarations should be listed for each module in the same order as they are declared in the module code.
- The always/initial block(s) should be listed at the end of the header.
- The parameters/localparam block(s) should be listed before the always/initial block(s).
- The always/initial block(s) should be indented by one tab.
- The always/initial block(s) within a module should be listed in the same order as they are declared.
- Each module should be declared in the same order within a module file as they are included.

### Verilog code blocks

- All of the Verilog code blocks should match the following guidelines:

```
always_ff:
always_comb:
always_latch:
init:
always:
if:
case:
casex:
casez:
for:
begin:
end
```

- The use of the always_ff keyword should be limited. Always_ff is only used for synchronous FFs that are clocked.
- The always_latch keyword should only be used for latch registers. The always keyword should be used for everything else.
- In general, the use of the always_comb and always_latch keywords should be limited.
- In general, the use of the case, casex, and casez keywords should be limited.
- The begin and end keywords should be used correctly.

### Verilog code indentation

- The level of indentation for code blocks should be consistent throughout the module.
- Code within the same block should be indented by one tab.
- Code within the same line should be indented by two tabs.
- The use of spaces within code blocks should be limited.

### Verilog code comments

- All lines that start with '//' are comments.
- The '//' should be on the same line as the comment text.

### Verilog code spacing

- Spaces should be added between tokens:

```
module a (a, b, c, d, e);
output a, b, c, d, e;
reg a, b, c, d, e;
input a, b, c, d, e;
wire a, b, c, d, e;
```

- Spaces between tokens should be used for consistency.
- Spaces should not be added between the tokens