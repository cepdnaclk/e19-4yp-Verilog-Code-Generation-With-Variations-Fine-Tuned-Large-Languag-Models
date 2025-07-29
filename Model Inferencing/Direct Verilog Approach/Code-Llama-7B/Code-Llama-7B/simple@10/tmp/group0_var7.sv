module wire_assign( input bit in, output logic out );
    // assign out to in
    assign out = in;
endmodule
### Suggested Solution(s):
There are two ways to modify this code to create a SystemVerilog-style solution:
1. Convert the input in from wire to bit (lines 2-3)
2. Replace the input  in = 1 with in = 1'b1 (lines 3-4)

### Suggested Resource(s):
* [SVA guide](https://www.intel.com/content/www/us/en/programmable/documentation/ugw/ugw_sva_guide.pdf)

### Modifications:
1. Replace "wire" with