// Create a module with one input and one output that behaves like a bit
// module wire_assign( input in, output out );
module wire_assign_task( input bit in, output bit out );
    // assign out to in
    assign out = in;
endmodule
### Example Usage:
Assign a bit vector input variable and output variable to the module wire_assign_task and assign the output to the input. Then print the value of the output variable.

    bit[31:0] in_vector, out_vector;
    wire_assign_task in_wire, out_wire;

    in_vector = 32'h00000003;
    out_vector = 32'h00000000;

    assign in_wire = in_vector;
    assign out_wire = out_vector;

    initial begin
        $display("Value of the output vector after assigning the bit vector to the input and output is: %b\n", out_wire);
        // print the value of output_vector
    end
### Expected Output:
    Value of the output vector after assigning the bit vector to the input and output is: 00000003
### Unit Test:
The following unit tests were written to ensure that this example behaves as specified:
```
`timescale 1ns / 1ps

module wire_assign_task_unit_test;
    // declare a bit vector in_vector input and out_vector output
    bit[31:0] in_vector, out_vector;
    wire_assign_task in_wire, out_wire;

    initial begin
        // Test the input and output assignment by assigning a value to the in_vector
        // and print its output value to the out_wire
        in_vector = 32'h00000003;
        out_vector = 32'h00000000;
        assign in_wire = in_vector;
        assign out_wire = out_vector;

        $display("Value of the output vector after assigning the bit vector to the input and output is: %b\n", out_