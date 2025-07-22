// Create a module with one input and one output that behaves like a wire
module wire_assign( input bit in, output out );
    // assign out to in
    assign out = in;
endmodule
### Test:
1: Test if assignment can be done using bit.
2: Test if assignment can be done using wire.

### Expected Results:
1: Test passes with bit.
2: Test passes with wire.

### Test Instruction:
1: Create an instance of the module, test, and test its functionality.
### Code:
// create a wire with the name 'input_wire' and connect it to an input bit with the name 'in'
wire input_wire;
input bit in;

// create an instance of wire_assign, name it 'wire_assign_inst', connect 'input_wire' to 'in'
wire_assign wire_assign_inst(.in(input_wire),.out(in) );
### Expected Results:
1: test passes.

### Test Instructions:
1: Add a third input bit in.
2: Connect 'in' to the third input bit.
3: Add a third input wire input_wire2.
4: Connect 'input_wire2' to the third input wire.
5: Test that 'in' is connected to 'input_wire2'.

### Expected Results:
1: 'in' is connected to 'input_wire2'.

### Test Instructions:
1: Add a second output bit out2.
2: Connect 'out2' to 'in'.
3: Test that 'out2' is connected to 'in'.

### Expected Results:
1: 'out2' is connected to 'in'.

### Test Instructions:
1: Add a second output wire out2.
2: Connect 'out2' to 'in'.
3: Test that 'out2' is connected to 'in'.

### Expected Results:
1: 'out2' is connected to 'in'.


### Test Instructions:
1: Add a third input bit in2.
2: Connect 'in2' to 'input_wire2'.
3: Test that  'in2' is connected to 'input_wire2'.

### Expected Results:
1: 'in2' is connected to 'input_wire2'.


### Test Instructions:
1: Connect 'out2' to 'input_wire2'.
2: Test that 'out2' is connected to 'input_wire2'.

### Expected Results:
1: 'out2' is connected to 'input_wire2'.


### Test Instructions:
1: Connect 'in2' to 'input_wire2'.
2: Test that 'in2' is connected to 'input_wire2'.

### Expected Results:
1: 'in2' is connected to 'input_wire2'.

### Test Instructions:
1: Connect 'out2' to 'input_wire'.
2: Test that  'out2' is connected to 'input_wire'.

### Expected Results:
1: 'out2' is connected to 'input_wire'.

### Test Instructions:
1: Connect 'in2' to the input wire 'input_wire'.
2: Test that  'in2' is connected to the input wire 'input_wire'.

### Expected Results:
1: 'in2' is connected to the input wire 'input_wire'.

### Test Instructions:
1: Add a second output bit out2.
2: Add a second input bit in2.
3: Add a second input wire input_wire.
4: Add a second output wire out2.
5: Connect 'out2' to 'input_wire2'.
6: Connect 'in2' to 'input_wire'.
7: Connect 'out2' to 'in2'.
8: Test that  'out2' is connected to 'input_wire2'.
9: Test that  'out2' is connected to 'input_wire'.
10: Test that  'out2' is connected to 'in2'.

### Expected Results:
1: 'out2' is connected to 'input_wire2'.
2: 'out2' is connected to 'input_wire'.
3: 'in2' is connected to 'input_wire'.
4: 'out2' is connected to 'in2'.

### Test Instructions:
1: Connect 'in2' to 'input_wire'.
2: Connect 'out2' to 'input_wire2'.
3: Test that 'in2' is connected to 'input_wire'.
4: Test that 'out2' is connected to 'input_wire2'.

### Expected Results:
1: 'in2' is connected to 'input_wire'.
2: 'out2' is connected to 'input_wire2'.

### Test Instructions:
1: Connect 'in2' to 'input_wire'.
2: Connect 'out2' to 'input_wire2'.
3: Connect 'in2' to 'input_wire'.
4: Test that 'in2' is connected to 'input_wire'.

### Expected Results:
1: 'in2' is connected to 'input_wire'.


### Test Instructions:
1: Connect 'out2' to 'input_wire2'.
2: Test that 'out2' is connected to 'input_wire2'.

### Expected Results:
1: 'out2' is connected to 'input_wire2'.

### Test Instructions:
1: Connect 'in2' to 'input_wire2'.
2: Connect 'out2' to 'input_wire'.
3: Test that 'in2' is connected to 'input_wire2'.
4: Test that 'out2' is connected to 'input_wire'.

### Expected Results:
1: 'in2' is connected to 'input_wire2'.
2: 'out2' is connected to 'input_wire'.

### Test Instructions:
1: Connect 'in2' to 'input_wire'.
2: Connect 'out2' to 'input_wire'.
3: Test that 'in2' is connected to 'input_wire'.
4: Test that 'out2' is connected to 'input_wire'.

### Expected Results:
1: 'in2' is connected to 'input_wire'.
2: 'out2' is connected to 'input_wire'.

### Test Instructions:
1: Connect 'in' to 'input_wire2'.
2: Connect 'out' to 'input_wire'.
3: Test that 'in' is connected to 'input_wire2'.
4: Test that 'out' is connected to 'input_wire'.

### Expected Results:
1: 'in' is connected to 'input_wire2'.
2: 'out' is connected to 'input_wire'.

### Test Instructions:
1: Connect 'in' to 'input_wire'.
2: Connect 'out' to 'input_wire2'.
3: Test that 'in' is connected to 'input_wire'.
4: Test that 'out' is connected to 'input_wire2'.

### Expected Results:
1: 'in' is connected to 'input_wire'.
2: 'out' is connected to 'input_wire2'.

### Test Instructions:
1: Connect 'in' to 'input_wire'.
2: Connect 'out' to 'input_wire'.
3: Test that 'in' is connected to 'input_wire'.
4: Test that 'out' is connected to 'input_wire'.

### Expected Results:
1: 'in' is connected to 'input_wire'.
2: 'out' is connected to 'input_wire'.

### Test Instructions:
1: Use 'inout' instead of 'input' and 'output'
2: Use inout instead of input and output

### Expected Results:
1: 'in' is connected to 'input_wire'.
2: 'out' is connected to 'input_wire2'.
2: 'in' is connected to 'input_wire'.
2: 'out' is connected to 'input_wire'.

### Test Instructions:
1: Connect 'in2' to 'input_wire2'.
2: Connect 'out2' to 'input_wire'.
3: Test that 'in2' is connected to 'input_wire2'.
4: Test that 'out2' is connected to 'input_wire'.

### Expected Results:
1: 'in2' is connected to 'input_wire2'.
2: 'out2' is connected to 'input_wire'.

### Test Instructions:
1: Connect 'in2' to 'input_wire'.
2: Connect 'out2' to 'input_wire2'.
3: Test that 'in2' is connected to 'input_wire'.
4: Test that 'out2' is connected to 'input_wire2'.

### Expected Results:
1: 'in2' is connected to 'input_wire'.
2: 'out2' is connected