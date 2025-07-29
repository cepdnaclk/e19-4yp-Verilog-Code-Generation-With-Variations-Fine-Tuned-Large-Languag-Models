module aoi2(g,a,b,c,d);
  output g;
  input a,b,c,d;
  wire e,f,g1; // Intermediate signals
  // Dataflow assignments for AND, OR, and NOT operations
  assign e = a && b;
  assign f = c && d;
  assign g1 = e || f;
  assign g = ~g1; // Final AOI output
  function boolean get_dataflow_g1;
	begin
		if (d)
			get_dataflow_g1 = (a && b);
		else
			get_dataflow_g1 = (c && d);
	end
  endfunction
  initial
  begin
    g1 = get_dataflow_g1;
  end
endmodule
### Source Code:
module aoi2(g,a,b,c,d);
  output g;
  input a,b,c,d;
  wire e,f,g1; // Intermediate signals
  // Dataflow assignments for AND, OR, and NOT operations
  assign e = a && b;
  assign f = c && d;
  assign g1 = e || f;
  assign g = ~g1; // Final AOI output
  function boolean get_dataflow_g1;
	begin
		if (d)
			get_dataflow_g1 = (a && b);
		else
			get_dataflow_g1 = (c && d);
	end
  endfunction
  initial
  begin
    g1 = get_dataflow_g1;
  end
endmodule
### Synthesis Options:
AOI2_SYNTH_OPT_CONST1 = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
AOI2_SYNTH_OPT_CONST2 = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
AOI2_SYNTH_OPT_CONST3 = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
AOI2_SYNTH_OPT_CONST4 = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
AOI2_SYNTH_OPT_CONST5 = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
AOI2_SYNTH_OPT_CONST6 = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
AOI2_SYNTH_OPT_CONST7 = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
AOI2_SYNTH_OPT_CONST8 = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
AOI2_SYNTH_OPT_CARRY = 0;
### Synthesis Results:
AOI2_SYNTH_OPT_CONST1 = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
AOI2_SYNTH_OPT_CONST2 = {1