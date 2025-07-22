module maj3 (a, b, c, y);
input a, b, c;
output y;
wire [2: 0] im;
assign im[0] = a & b;
assign im[1] = b & c;
assign im[2] = c & a;
assign y = |im;
endmodule
### Result:
Wires are synthesized with only 3 bits for the indexing, instead of 5.

## Result
### Simulation:
Test cases:
(0, 0, 1) -> 1
### Synthesis:
```
$ yosys -p "read_verilog maj3/maj3.v; proc; opt_clean; write_json maj3/maj3.json" maj3/maj3.v
```
#### Logic Equivalent
![Logic Equivalent](maj3/maj3.png)
### Verilog-to-Json:
```
$ yosys -p "read_verilog maj3/maj3.v; proc; opt_clean; write_json maj3/maj3.json" maj3/maj3.v
```

```
module maj3 (// verilator lint_off PINCONNECTEMPTY
   input logic a,
   input logic b,
   input logic c,
   output logic y
);
   logic im1;
   logic im2;
   logic im3;

   // verilator lint_off PINMISSING
   assign im1 = a & b;
   assign im2 = b & c;
   assign im3 = c & a;
   assign y = |{im1, im2, im3};
endmodule
```

### Test Case Logic:
#### 0 0 1
![0 0 1](maj3/maj3_001.png)
### Synthesis Result:
![Synthesis Result](maj3/maj3_synthesis.png)
### Wire Widths
![Wire Widths](maj3/maj3_wire_widths.png)