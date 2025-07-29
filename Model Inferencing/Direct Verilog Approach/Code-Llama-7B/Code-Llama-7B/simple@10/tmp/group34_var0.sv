wire_assign2 module( input in, output out );
    assign out = in;
endmodule

wire_assign3 module( input [3:0] in, output [3:0] out );
    for (genvar i=0; i<4; i++) begin:gen_wire_assign
        assign out[i] = in[i];
    end
endmodule
### How to Run:
```
$ iverilog wire_assign2.v wire_assign3.v
$./a.out
```
### Expected Output:
```
# ** No output expected. **
```
### Simulation Output
```
$./a.out
```
### References:
[1][https://www.verilogpro.com/wire-verilog-tutorial-and-examples/#associative-arrays]
### 2.4
### Base Verilog Code:
// Create a module with one input and one output that behaves like a wire
module wire_assign( input in, output out );
    // assign out