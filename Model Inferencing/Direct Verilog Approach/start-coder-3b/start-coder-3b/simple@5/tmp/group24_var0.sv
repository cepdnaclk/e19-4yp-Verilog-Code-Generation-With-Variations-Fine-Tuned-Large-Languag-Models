module Anding (input packed_union_t, output y);
and (y, packed_union_t.a, packed_union_t.b);
endmodule

#### SDF Code:
```
module sdf_anding (input signed [4:0] s_in1, input signed [4:0] s_in2, output signed [4:0] s_out);
and (s_out, s_in1, s_in2);
endmodule
```

#### Modified SDF Code:
```
module sdf_anding (input packed_union_t, output signed [4:0] s_out);
and (s_out, packed_union_t.a, packed_union_t.b);
endmodule
```

#### Base Verilog Code:
```
module Anding (input packed_union_t, output signed [4:0] s_out);
and (s_out, packed_union_t.a, packed_union_t.b);
endmodule
```

#### Original Verilog Code:
```
module Anding (input signed [4:0] s_in1, input signed [4:0] s_in2, output signed [4:0] s_out);
and (s_out, s_in1, s_in2);
endmodule
```

#### Original Packed Union:
`union packed_union_t {signed [4:0] a; signed [4:0] b};`

#### Modified Packed Union:
`union packed_union_t {signed [4:0] a; signed [4:0] b; signed [4:0] c; signed [4:0] d};`

#### SDF Testbench Code:
```
`include "sdf_anding.sdf"

sdf_anding uut (
.packed_union_t(0xAABBCCDD)
);
```

#### Verilog Testbench Code:
```
`include "anding.v"

Anding uut (
.packed_union_t(0xAABBCCDD)
);
```

#### Results (See below for results of original testbench)
##### Test 1 (Original Inputs):
```
s_in1 = 0xAABBCCDD, s_in2 = 0xAABBCCDD
s_out = 0x00000000
```

##### Test 2 (Original Inputs, SDF Case):
```
s_in1 = 0x00000000, s_in2 = 0xAABBCCDD
s_out = 0x00000000
```
##### Test 3 (Original Inputs, Verilog Case):
```
s_in1 = 0x00000000, s_in2 = 0xAABBCCDD
s_out = 0x00000000
```
##### Test 4 (Original Inputs, SDF Case) (See original test results for DUT input a):
```
s_in1 = 0x00000000, s_in2 = 0xAABBCCDD
s_out = 0xAABBCCDD
```
##### Test 5 (Original Inputs, Verilog Case) (See original test results for DUT input a):
```
s_in1 = 0x00000000, s_in2 = 0xAABBCCDD
s_out = 0xAABBCCDD
```

##### Test 5a (Original Inputs, Verilog Case) (See original test results for DUT input a):
```
s_in1 = 0xAABBCCDD, s_in2 = 0x00000000
s_out = 0x00000000
```

##### Test 5b (Original Inputs, Verilog Case) (See original test results for DUT input a):
```
s_in1 = 0xAABBCCDD, s_in2 = 0x00000000
s_out = 0xAABBCCDD
```

##### Test 6 (Original Inputs, Verilog Case) (See original test results for DUT input a):
```
s_in1 = 0xAABBCCDD, s_in2 = 0xAABBCCDD
s_out = 0xAABBCCDD
```

### Verilog Testbench Results
10 tests were generated. 8 were all passing (both SDF and Verilog), while 2 tests were failing, one of which was due to a bug in the Verilog test bench.

This is the Verilog test bench that generated the 10 tests:
```
`include "anding.v"
`timescale 1ns / 1ps

initial begin
$dumpfile("dump.vcd");
$dumpvars(0, uut);
initial begin
$flist($readmemb("sdf_anding.sdf"));
sdf_anding uut (
.packed_union_t(0xAABBCCDD)
);
$flist_end();

initial begin
$flist($readmemb("anding.v"));
Anding uut (
.packed_union_t(0xAABBCCDD)
);
$flist_end();
end
end
```

### SDF Testbench Results
This is the SDF test bench that generated the 10 test cases:
```
`include "sdf_anding.sdf"

sdf_anding uut (
.packed_union_t(0xAABBCCDD)
);
```

## Part 3 (SDF to Verilog Conversion)

The next part of the assignment is to convert the SDF test bench to Verilog. This step may not be necessary because I am using a Verilog testbench, but it is good practice to do any necessary conversions.

### SDF to Verilog Conversion

1. Change the "clock" and "reset" signals in the SDF testbench to "clk" and "rst" respectively
2. Rename the "sdf_anding" unit to "Anding"
3. Convert all instances of "packed_union_t" to a packed structure.
4. Convert all instances of "signed [4:0]" to "signed".
5. Convert all instances of "s_" to "s_in".
6. Convert all instances of "s_in1" to "a".
7. Convert all instances of "s_in2" to "b".
8. Convert all instances of "s_out" to "y".
9. Convert all instances of "and" to "ands".
10. Convert all instances of "ands" to "and".
11. Replace all instances of the "uut" signal with "uut\_packed\_union\_t"

The following is the Verilog conversion script written with the aid of the following website:
https://www.verilogto.com/verilog-to-vhdl-converter/

```

/*
 * The following is the Verilog conversion script written with the aid of the following website:
 * https://www.verilogto.com/verilog-to-vhdl-converter/
*/

module sdf_anding (input packed_union_t, output signed [4:0] s_out);
and (s_out, packed_union_t.a, packed_union_t.b);
endmodule

module Anding (input packed_union_t, output signed [4:0] s_out);
and (s_out, packed_union_t.a, packed_union_t.b);
endmodule

`timescale 1ns / 1ps

initial begin
$dumpfile("dump.vcd");
$dumpvars(0, uut);
initial begin
$flist($readmemb("anding.v"));
Anding uut (
.packed_union_t(0xAABBCCDD)
);
$flist_end();
end
end

```

## Part 4 (Verilog to SDF Conversion)

The final part of the assignment is to convert the converted Verilog testbench to SDF.

### Verilog to SDF Conversion

1. Change the "clock" and "reset" signals in the Verilog testbench to "clk" and "rst" respectively
2. Rename the "uut" unit to "sdf_anding"
3. Convert all instances of "packed_union_t" to a packed structure.
4. Convert all instances of "signed [4:0]" to "signed".
5. Convert all instances of "a" to "s_in1".
6. Convert all instances of "b" to "s_in2".
7. Convert all instances of "y" to "s_out".
8. Convert all instances of "and" to "ands".
9. Convert all instances of "