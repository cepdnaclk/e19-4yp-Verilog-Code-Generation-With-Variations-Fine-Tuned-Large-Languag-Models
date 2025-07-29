module show_aa_mod(ao,ai); // NOT gate with delay 2
  output ao; input ai; wire ao, ai;
  not #2 (ao,ai);
endmodule
### Parameters:
None
### Sources:
None
### RTL:
ao = ~ai;
### Simulation:
A: 1, B: 1 -> ao = 0
A: 0, B: 0 -> ao = 1
A: 0, B: 1 -> ao = 1
A: 1, B: 0 -> ao = 0
A: 1, B: 2 -> ao = 1
A: 2, B: 1 -> ao = 0
A: 2, B: 2 -> ao = 1
### Summary:
enum values can be used as input to gates and other logic blocks.
### Related:
None
### Similar:
None
### Variation:
None
### References:
None
### Future Extensions: