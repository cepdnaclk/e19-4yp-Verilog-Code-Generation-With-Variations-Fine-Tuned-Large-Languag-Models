module show_aa(ao,ai); // NOT gate with delay 2
  output ao;
  packed enum{
    A = 1,
    B = 2,
    none = 0,
  } ai;
  wire ao,ai;
  not #2 (ao,ai);
endmodule
```

For a more complex example, the `not` gate can be used to swap two input variables by using `wire` to declare an aliaed signal, then using `assign` to assign the `not`ed signal to the aliaed signal.  For example, to swap two packed enums, the following code can be used:

```verilog
module show_aa(ao_out,ai_in,ai_out);
  packed enum{A = 1, B = 2, none = 0} ai_in;
  packed enum{A = 1, B = 2, none = 0} ai_out;
  output [1:0] ao_out;
  wire [1:0] ai_out[1:0];

  not #2 (ao_out, ai_out); // ai_out =!ai_out
  assign ai_out[1:0] = ai_in[1:0];
  assign ai_in[1:0] = ai_out[1:0];
endmodule
```

The `not` gate can be used to swap two variables by using `wire` to declare an aliaed signal, then using `assign` to assign the `not`ed signal to the aliaed signal.  For example, to swap two packed enums, the following code can be used:

```verilog
module show_aa(ao_out,ai_in,ai_out);
  packed enum{A = 1, B = 2, none = 0} ai_in;
  packed enum{A = 1, B = 2, none = 0} ai_out;
  output [1:0] ao_out;
  wire [1:0] ao_in[1:0];

  not #2 (ao_out, ao_in); // ao_in =!ao_in
  assign ao_out[1:0] = ao_in[1:0];
  assign ao_in[1:0] = ao_out[1:0];
endmodule
```

### Packing vs. Enum-Packing

One interesting thing about `packed` enums is that any enum element can be used in a `packed` enum declaration.  By enumering all values except 0, any element can be used in the `packed` enum declaration.  For example,

```verilog
// This is an invalid declaration of packed enum, because 0 is not in the enum list
packed enum{
    A = 1, B = 2, none = 0
} ao;
```

However, a packed enum is not limited to only having elements in the enum list.  For example, the code below is valid, because the second element is also in the enum list.

```verilog
packed enum{
    A = 1, B = 2, none = 0
} ao;
```

### Packed Enums in Verilog

As of November 12th, 2014, packed enums are not yet supported by the Bison Verilog parser and the Verilator compiler.  You must use the `packed` keyword when declaring packed enums to make sure that the enum values are packed.  However, this restriction does not apply to the `enum` keyword, which is used to create packed enums.  For example, the following code is valid, but the code below will not compile because the second element is not in the enum list.

```verilog
// This is a valid declaration of packed enum
packed enum{
    A = 1, B = 2, none = 0
} ao;
```

```verilog
// This is an invalid declaration of packed enum, because second element is not in list
packed enum{
    A = 1, B = 2
} ao;
```

### Caveat: Using Enums in Verilog

Enums are not natively supported by Verilog.  Because of this, enums must be cast to integers before they can be used in a Verilog testbench or other simulation.  For example, the following code will not compile:

```verilog
module show_aa(ao);
  enum {
    A = 1, B = 2, none = 0
  } ai;
  output ao;
  assign ao = ai;
endmodule
```

This will not compile because the enum is an uncast enum and cannot be used in a Verilog testbench.  However, the following code will compile because the enum is cast to `int`.

```verilog
module show_aa(ao);
  enum {
    A = 1, B = 2, none = 0
  } ai;
  output ao;
  assign ao = int(ai);
endmodule
```

### Casting Enums in Verilog

Casting enums to integers in Verilog will not work for all cases.  If the enum is not used, then the enum can be cast simply to an integer without issues.  For example, the following code will compile.

```verilog
module show_aa(ao);
  enum {
    A = 1, B = 2, none = 0
  } ai;
  output ao;
  assign ao = int(ai);
endmodule
```

However, if the enum is used in a testbench, then casting to an integer will not work in all cases.  For example, the following code will not compile, because the enum is used as an output in a testbench.

```verilog
module show_aa(ao);
  enum {
    A = 1, B = 2, none = 0
  } ai;
  output ao;
  assign ao = int(ai);
endmodule
```

```verilog
module show_aa_tb(ao);
  input clk;
  wire ai;
  show_aa(ai,clk,2'b00);
  initial begin
    ai = 1;
  end
  initial begin
    posedge clk begin
      ai = ai + 1;
    end
  end
endmodule
```

This will not compile because the enum is used as an output in a testbench.  However, this will compile if the enum is not used as an output in a testbench.

```verilog
module show_aa_tb(ao);
  input clk;
  wire ai;
  show_aa(ai,clk,2'b00);
  initial begin
    ai = 1;
  end
  initial begin
    posedge clk begin
      ai = ai + 1;
    end
  end
endmodule
```

The following code will work because the enum is not used as an output in a testbench.

```verilog
module show_aa_tb(ao);
  input clk;
  wire ai;
  show_aa(ao,clk,2'b00);
  initial begin
    ai = 1;
  end
  initial begin
    posedge clk begin
      ai = ai + 1;
    end
  end
endmodule
```

### Packed Enum vs. Non-Packed Enum

Packed enums are represented as arrays of bits.  Non-packed enums are represented as integers.  As such, the code below will not work, because `non_packed_enum` is not a packed enum type.

```verilog
packed enum{
  A = 1, B = 2, none = 0
} packed_enum;

non_packed_enum non_packed_enum;
```

When using the `packed` keyword, the size of an enum can be set by using the `:` character operator.  For example, `show_aa` can be used to show an example of specifying the size of an enum.

```verilog
show_aa(ao, ai, 2'b00);
show_aa(ao, ai, 3'b00);
show_aa(ao, ai, 4'b00);
```

If a value is not specified, Verilog will use the default size of an `int` type, which is 32 bits.  For example, `show_aa` can be used to show an example of specifying the size of an enum.

```verilog
show_aa(ao, ai);
```

### Enums vs. Bit-Vectors

Enums are different than bit-vectors in that enums can only be assigned `0` or `1` values.  For example, the following code will not compile, because the enum is not assigned a value.

```verilog
enum a; // Compiler Error, cannot have unassigned enums
```

## 7. Functions

### Basic Function

Verilog functions can only contain input and output ports.  For example, if `add_one` were to be used as a function, the following code will not compile because it has an input port `clk`.

```verilog
module add_one(ao,ai); // Function should not have input ports
  // Function should not have input ports