module wire_assign( input in, output out );
    // assign out to in
    assign out = in;
endmodule
### Error Message:
```
$ iverilog -o test.out test.v
test.v:3: error: module 'wire_assign' does not have an assign for output 'out'
```
### Notes:
The compiler will give an error because out is an output port of wire_assign and it has no assign assigned to it.

### Fixed Code:
module wire_assign( input in, output out );
    // assign out to in
    assign out = in;
endmodule
### Error Message:
```
$ iverilog -o test.out test.v
test.v:3: error: module 'wire_assign' does not have an assign for output 'out'
```
### Notes:
The compiler will give an error because out is an output port of wire_assign and it has no assign assigned to it.

## Case 9: Using SystemVerilog bit types in assignment (multiple type mismatched)

### Base Verilog Code:
module wire_assign( input in, output out );
    assign out = in;
endmodule
### Variation Instruction:
Change the type of the input and output from