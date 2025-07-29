module testbench1;

	localparam clock_period = 100;
	localparam stimuli_size = 17;

	reg clock;
	
	reg [7:0] stimuli [stimuli_size];
	wire [7:0] out;

	integer i;

	dff_inst inst(.D(stimuli[0]),.Clock(clock),.Resetn(0),.Q(out));

	always begin
		clock <= 0; # clock_period/2;
		clock <= 1; # clock_period/2;
	end

	initial begin
		stimuli[0] = 8'b11111111;
		for (i = 1; i < stimuli_size; i = i + 1) begin
			stimuli[i] = stimuli[i-1] - 1;
		end
		# 3*clock_period;
		$finish;
	end

endmodule

### Explanation:
This example demonstrates the usage of dynamic arrays to pass a list of inputs to the flip-flops.
In addition, the testbench has been modified to include a larger stimuli size so that it is easier
to observe the behavior of the flip-flops.
### Testing:
- Run the synthesis
- Open `dff_inst.synthesis.v` and check the generated flip-flops
- Run the simulation
- Open `d