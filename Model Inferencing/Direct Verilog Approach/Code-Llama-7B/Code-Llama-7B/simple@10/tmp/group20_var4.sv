module latch (input d, c, output [7:0] q, q_b );
always begin
wait ( c );
end
endmodule
### Simulation:
simulator: ModelSim 10.3
### Passed:
yes
### Skipped:
no
### Failed: