module test;
packed struct my_struct {
    wire a;
    wire b;
    reg x;
} packed_struct;
always #25 packed_struct.a = b;
endmodule
```

### Packing 10: Packing Registers with Other Struct Types
```
### Base Verilog Code:
module test;
reg x;
reg y;
endmodule
### Variation Instruction:
Use a packed structure to contain the signals