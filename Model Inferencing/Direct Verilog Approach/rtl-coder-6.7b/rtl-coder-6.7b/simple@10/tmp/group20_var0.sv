module latch (input d, c, output reg [7:0] q, q_b );
always begin
wait ( c );
end
endmodule
### Simulation Command:
set_global timing_report_detailed_waveform 1
run 100
report timing -max_paths 2 -capacitance
report wave -signals