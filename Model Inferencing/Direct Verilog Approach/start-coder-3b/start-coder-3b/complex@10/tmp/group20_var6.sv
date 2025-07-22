module mixed_sim;
reg dcontrol, x, y;
reg [31:0] data;
wire [31:0] bus;
assign bus = dcontrol? data : 'bz;
always @x
y = ~x;
initial
begin
$monitor("time=%d dcontrol=%d data=%d x=%d y=%d bus=%d",
$time, dcontrol, data, x, y, bus);
dcontrol = 0;
end
`# 7. Re-arranging Assignment Operators

In general, we have two types of assignment operators, the binary assignment operator (`=`) and the unary assignment operator (`:=`).

Binary assignment:

```verilog
assign a = 5 + 2;
```

Unary assignment:

```verilog
assign b = 10;
assign b = a;
```

There is no restriction on the order of the assignment operators; that is, we can write the above in two different ways:

```verilog
assign a = 5 + 2;
assign b = a;
assign b = 10;
```

vs.

```verilog
assign b = 10;
assign a = 5 + 2;
assign b = a;
```

The only restriction is that the top-level assignment operator (`=`) has to be unary or binary, while the nested ones (`:=`) must be binary.

The above is not valid:

```verilog
assign b = a;
assign b = 10 + 5;
```

The `:=` operator has to be binary, and it has to appear on the left-hand side of the assignment operator.
# 3. Using $dumpall to View Simulation Results

The `$dumpall` command writes all the internal signals and memory elements to an output file. It is primarily useful for debugging purposes and is not very useful in general use.

`$dumpall` is useful for debugging, but it is not a good idea to use it in production code.

## Example:

```verilog
module mymodule;
  wire [3:0] a;
  reg  [3:0] b;
  reg  [3:0] c;

  always @* begin
    $dumpall(c);
  end

  assign b = a;
endmodule
```

## Running the Example:

```zsh
$ verilator -Wall --trace -cc mymodule.v --exe verilator_main.cpp
$ make -j -C obj_dir -f Vmymodule.mk
$./obj_dir/Vmymodule
```
# 7. Combinational Circuits

Combinational circuits do not have sequential elements (i.e., no `always` blocks).# 2. A Simple Verilog Example

We will be using the Verilator tool.

## Example:

```verilog
module mymodule;
  wire [3:0] a;
  reg  [3:0] b;
  reg  [3:0] c;

  always @* begin
    b <= a;
    c <= a;
  end
endmodule
```

## Running the Example:

```zsh
$ verilator -Wall --trace -cc mymodule.v --exe verilator_main.cpp
$ make -j -C obj_dir -f Vmymodule.mk
$./obj_dir/Vmymodule
```
# 3. Verilog Comments

Verilog supports two types of comments: the single-line comment and the block comment.

Comments are ignored by the Verilog compiler, but they are included in the output file.

## Single-Line Comment

A single-line comment begins with `//`, and it ends at the end of the line.

```verilog
// Single line comment
```

## Block Comment

A block comment begins with `/*` and ends with `*/`. Unlike a single-line comment, the block comment can span multiple lines.

```verilog
/*
Block comment
Block comment
Block comment
*/
```
# 3. Verilog Symbols and Names

## Symbol Names

Symbol names are not case sensitive. The following are all valid symbol names:

```verilog
a
A
1_a
A1
```

## Reserved Names

The following are reserved names. They cannot be used as the names of anything other than a package name in the `package` declaration:

- bit
- break
- byte
- case
- casex
- casez
- chandle
- class
- context
- cos
- const
- constructor
- continue
- cos
- data
- default
- define
- disable
- dist
- do
- else
- end
- enum
- event
- event
- false
- final
- fork
- foreign
- foreach
- for
- function
- highz0
- highz1
- hierarchical
- if
- include
- interface
- join
- join
- join_any
- join_none
- join_some
- join_any
- join_none
- join_some
- join
- join
- join
- label
- let
- longint
- localparam
- logic
- lowz0
- lowz1
- mac
- match
- module
- negedge
- new
- nmos
- nop
- nor
- not
- null
- or
- output
- package
- pack
- packed
- parameter
- pmos
- pulldown
- pullup
- pulldown_hiz
- pullup_hiz
- real
- realtime
- reg
- repeat
- return
- shortint
- shortreal
- shortvector
- small
- specparam
- static
- strong0
- strong1
- struct
- sup
- sync_accept_on
- sync_accept_on
- sync_reject_on
- sync_reject_on
- sync_reject_on
- sync_reject_on
- table
- task
- this
- this
- time
- timeunit
- tri
- triand
- trior
- true
- trireg
- type
- typedef
- unsigned
- untyped
- use
- very
- weak0
- weak1
- while
- wildcards
- wand
- wire
- wor
- xnor
- xnor2
- xor
- xor2
- xnor2
- xor2
- xnor2
- xor2
- xor2

Symbol names starting with a dollar sign (`$`) are also reserved. For example, the names `$readmemh`, `$writememh` and `$finish` are reserved.
# 5. Verilog Code Formatting

Verilog code formatting is important because it improves readability. It can be configured in a number of different ways. However, the easiest way to format the code is with the `verilator-format` tool.

## Installing verilator-format

### Ubuntu

```zsh
$ sudo apt install verilator-format
```

### Fedora

```zsh
$ sudo dnf install verilator-format
```

## Formatting the Verilog Code

```zsh
verilator-format --indent-with-tabs --tab-stop=2 --input file.v
```
# 3. Using $dumpfile and $dumpvars

The `$dumpfile` command is used to determine the name of an output Verilog file, and the `$dumpvars` command is used to specify whether variables and nets from a Verilog file are dumped.

## Example:

```verilog
module mymodule;
  reg  [3:0] a;
  wire  [3:0] b;
  wire  [3:0] c;

  always @* begin
    $dumpvars(1, mymodule, a);
    $dumpfile(mymodule.vcd);
    $dumpvars(0);
  end
endmodule
```

## Running the Example:

```zsh
$ verilator -Wall --trace -cc mymodule.v --exe verilator_main.cpp
$ make -j -C obj_dir -f Vmymodule.mk
$./obj_dir/Vmymodule
```
# 7. Using $dumpvars

The `$dumpvars` command is used to specify whether variables and nets from a Verilog file are dumped.

## Example:

```verilog
module mymodule;
  reg  [3:0] a;
  wire  [3:0] b;
  wire  [3:0] c;

  always @* begin
    $dumpvars(0);
  end
endmodule
```

## Running the Example:

```zsh
$ verilator -Wall --trace -cc mymodule.v --exe verilator_main.cpp
$ make -j -C obj_dir -f Vmymodule.mk
$./obj_dir/V