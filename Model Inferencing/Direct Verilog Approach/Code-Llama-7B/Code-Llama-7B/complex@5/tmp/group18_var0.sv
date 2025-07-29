module dff_aa(q); // Behavioral DFF with async controls and conditional path delay
  output q; 
  reg q;
  // Specify
  specify
    // Conditional path delay: clk->q edge-sensitive path active only if clr and pr are low
    if (!clr &&!pr) (posedge clk *> (q:di)) = 1;
  endspecify
  // Behavioral description with async reset/preset priority
  always @(posedge clk or posedge clr or posedge pr) // Added async sensitivity
    if(clr) q <= 1'b0; // Use non-blocking <=
    else if(pr) q <= 1'b1; 
    else q <= di;
endmodule
### Note:
Do not modify any code outside the `specify` and `endspecify` blocks. The entire `specify` and `endspecify` must be kept intact.
### Waveform:
![](TestDff.png)

### File Description:
- `dff_aa.sv` is the modified file with the changes described above.
- `run_test.tcl` is the script to run the simulation.

### Expected Output:
![](dff_aa_output.png)

### Simulation Setup:
`xrun -sim dff_aa.sv -waves dff_aa.vcd -gui -tclbatch run_test.tcl`

### Simulation Output:
![](simulation_output.png)

- - -
© 2019