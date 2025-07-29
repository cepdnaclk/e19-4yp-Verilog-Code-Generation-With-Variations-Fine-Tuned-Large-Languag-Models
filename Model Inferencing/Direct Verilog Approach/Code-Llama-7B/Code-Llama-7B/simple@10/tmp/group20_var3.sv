module latch (input d, c, output logic [7:0] q, q_b );
always begin
wait ( c );
end
endmodule
### Simulation Output:
sim > add wave /* add all sigs */
sim > run 1000 /* run 1000 sim clks */
Time: 0 ps  Iteration: 0  Instance: /latch
d                                                       : 0
c                                                       : 1
q                                                       : x
q_b                                                     : x

Time: 1000 ps  Iteration: 1  Instance: /latch
d                                                       : 1
c                                                       : 1
q                                                       : 1
q_b                                                     : 0

Time: 2000 ps  Iteration: 2  Instance: /latch
d                                                       : 1
c                                                       : 1
q                                                       : 1
q_b                                                     : 0

Time: 3000 ps  Iteration: 3  Instance: /latch
d                                                       : 1
c                                                       : 1
q                                                       : 1
q_b                                                     : 0

Time: 4000 ps  Iteration: 4  Instance: /latch
d                                                       : 1
c                                                       : 1
q                                                       : 1
q_b                                                     : 0

Time: 5000 ps  Iteration: 5  Instance: /latch
d                                                       : 1
c                                                       : 1
q                                                       : 1
q_b                                                     : 0

Time: 6000 ps  Iteration: 6  Instance: /latch
d                                                       : 1
c                                                       : 1
q                                                       : 1
q_b                                                     : 0

Time: 7000 ps  Iteration: 7  Inst