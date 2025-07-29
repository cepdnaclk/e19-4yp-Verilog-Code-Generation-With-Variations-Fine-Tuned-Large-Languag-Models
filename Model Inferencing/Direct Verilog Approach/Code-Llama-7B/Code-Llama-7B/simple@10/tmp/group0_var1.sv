// Create a module with one input and one output that behaves like a wire
module wire_assign( input bit in, output out );
    // assign out to in
    assign out = in;
endmodule
### Run on FPGA:
Run the modified module on the FPGA by creating a test bench module that instantiates the modified wire_assign module.
### Experiment:
1. Change the type of the input in from bit to wire to see the different between two types
### Conclusion:
// Conclusion:
The type of the data source of output of a module