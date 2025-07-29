module testbench ();
generate struct {rand reg data;} data;
process data;
endmodule
### Expected Outcome:
The data structure should be filled with random values and the structure should be generated once.
### Actual Outcome:
The generate block is not