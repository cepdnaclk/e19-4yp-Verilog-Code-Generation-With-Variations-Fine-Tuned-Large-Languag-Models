module dff_inst(D, Clock, Resetn, Q);
input D, Clock, Resetn;
output Q;
defparam dff_inst.input_data = ["000", "001", "010", "011", "100","101","110","111"];
lpm_ff flipflop(.data(D[dff_inst.input_data]),.aclr(Resetn),.clock(Clock),.q(Q));
defparam flipflop.lpm_width = 1;
defparam flipflop.lpm_depth = 8;
endmodule
### Executing VCS
vcs -full64 +vcs+lic+wait +v2k dff_inst.sv
The simulation will look like the following screenshot:

## References

The following resources were used in this tutorial:

Author