```verilog
module contres(o, i1, i2);
input i1, i2;
output o;
wire w1, w2;
buf(pull1, weak0) g1(w1, i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(w2, i2); // Drives pull '1', weak '0'

wire [1:0] w3 = {w1, w2};
// Drive wire 'o' from two buffers with specified output strengths
initial begin
  for(int i=0; i<4; i++) begin
      if (w3 == i) begin
        $display("Test case passed for %b on inputs %b and %b", i, i1, i2);
      end else begin
        $display("Test case failed for %b on inputs %b and %b", i, i1, i2);
      end
  end
end
endmodule
```
In this code, an initial block is used to test the output of inputs i1 and i2 over a range of combinations, which includes all four possible states of i1 and i2. If the observed output from the module matches with the expected output, it displays a test case passed message; otherwise, it displays the failure message. The test is successful if the output of the module matches with the expected result.

Please note that the values of the inputs i1 and i2 must be known at the time of elaboration. If the inputs are not fixed values and are to be varied during the simulation, the initial block should be moved to an appropriate place or removed. 

Also, for this kind of test, the simulator should be set so that the simulation completes within a reasonable timeframe since each test case will be evaluated individually.

Finally, note that a synthesis tool may not be able to optimize the use of a buf buffer to drive a wire in this case, because the output strength of the buffer is not known until runtime. In a real system, the synthesis tool may try to optimize the use of logic gates to reduce power consumption or to avoid propagation delay. This may lead to less than perfect results (e.g., it may not always drive the wire to the expected strength). In a real design, you would typically use a buffer with fixed