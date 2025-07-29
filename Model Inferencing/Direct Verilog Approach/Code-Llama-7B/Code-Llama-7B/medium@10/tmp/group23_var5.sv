module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[15:0];
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
always @(posedge Clk)
if (Read==1'b0)
    Storage[Adr] <= Ibus;
else begin
    ObusReg <= Storage[Adr];
    while(1'b1) begin
        $display("Hello World!");
        $finish(0);
        `ifdef FORMAL_VERIF
        assume(0);
        `endif
    end
end
endmodule
### Expected Output:
```
### Formal Verification (Formal Verifier)

Formal Verifier (FV) accepts an SVA (SystemVerilog Assertion) file. The file must contain an SVA (SystemVerilog Assertion) defined with the following syntax:

```SystemVerilog {.line-numbers}
assert [always|eventually|implicitly_on] {sva_name} ( {sva_condition} ) 
  severity {sva_severity};
```

The **sva_condition** field accepts any valid SVA (SystemVerilog Assertion). The **sva_severity** may be any of the following:

| Severity | Description 
| :------: | -----------------
| fatal    | The assertion must always be True in the design.
| error    | The assertion must be True most of the time in the design.
| warning  | The assertion may be False some of the time in the design. This may be OK, depending on the design intent.
| info     | The assertion may be False occasionally in the design. This may be OK, depending on the design intent.
| ignore   | Ignore (do not care) the assertion.

### Formal Verification Configuration for Verilator

The following options are supported for formal verification with Verilator:

+ **--assert**: Specify a file containing SVA (SystemVerilog Assertion) to execute. If multiple files are provided, each one is executed.
+ **--trace**: Generate a VCD (Value Change Dump) trace file that can be used for formal verification.
+ **--trace-structtrace**: Generate a structural VCD trace file that can be used for formal verification.
+ **--sv**: Generate Verilog which contains SVA (SystemVerilog Assertion). This is required for formal verification.
+ **--exe**: Generate C/C++ executable. This is required for formal verification.


### Formal Verification Configuration for NCVerilog

The following options are supported for formal verification with NCVerilog:

+ **--formal**: Generate Formal Assertion code. This is required for formal verification.
+ **--trace**: Generate a VCD (Value Change Dump) trace file that can be used for formal verification.
+ **--trace-structtrace**: Generate a structural VCD trace file that can be used for formal verification.
+ **--assert**: Specify a file containing SVA (SystemVerilog Assertion) to execute. If multiple files are provided, each one is executed.
+ **--exe**: Generate C/C++ executable. This is required for formal verification.

### Formal Verification Configuration for Yosys/Icarus

The following options are supported for formal verification with Yosys/Icarus:

+ **-p**: Generate Verilog which contains SVA (SystemVerilog Assertion). This is required for formal verification.
+ **-o**: Generate C/C++ executable. This is required for formal verification.
+ **-f**: Specify a file containing SVA (SystemVerilog Assertion) to execute. If multiple files are provided, each one is executed.
+ **--vcd**: Generate a VCD (Value Change Dump) trace file that can be used for formal verification.
+ **--struct-vcd**: Generate a structural VCD trace file that can be used for formal verification.

### Formal Verification Configuration for CBMC

The following options are supported for formal verification with CBMC:

+ **-V**: Specify a file containing SVA (SystemVer