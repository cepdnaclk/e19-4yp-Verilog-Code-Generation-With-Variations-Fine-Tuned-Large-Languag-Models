```verilog
module t_Clock_Prog ();
wire clock;
wire [3:0] Resetn;

initial #100 $finish;
Clock_Prog M1 (clk, Resetn);
endmodule
```

In this modified code, we have added an input `Resetn` of type `wire [3:0]`. This will allow for the testing of enum based Resetn values. You can also replace 3:0 with different bit widths, for example, replacing 3:0 with 1:0 or 5:0, etc. This will help in varying the Resetn values.

You can use Enum feature in SystemVerilog to define an enum type and assign the default and non-default enum values to the Resetn input.

Here is an example of how you can do it:

```verilog
`ifndef __DEFINES_VH__
`define __DEFINES_VH__

`define ENUM_RESETN_DEFAULT    4'b1111
`define ENUM_RESETN_NONDEFAULT 4'b0000

typedef enum bit[3:0] {
    ENUM_RESETN_DEFAULT    = `ENUM_RESETN_DEFAULT,
    ENUM_RESETN_NONDEFAULT = `ENUM_RESETN_NONDEFAULT
} ENUM_RESETN;

`endif
```
Then use the enum type in your testbench or module:

```verilog
module t_Clock_Prog ();
wire clock;
ENUM_RESETN Resetn;

initial #100 $finish;
Clock_Prog M1 (clk, Resetn);
endmodule
```

In this case, the enum Resetn will be tested with the default and non-default values `1111` and `0000`, respectively. 

Please note that, in the SystemVerilog enum, the type of the enum should match with the width of the Resetn input, here its 4 bit. So, you need to choose width of your Resetn input depending on the enum type.