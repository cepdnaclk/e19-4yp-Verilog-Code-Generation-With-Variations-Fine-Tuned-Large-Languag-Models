module pulses_new;
  reg [8:0] I;
  reg a,b;
  initial
    while (I<100) begin // Loop based on integer I
      b = I[1]; // Assign bit 1 of I to b
      I = I + 1; // Increment I
    end
  initial I=0; // Initialize I
  initial #100 $stop; // Stop simulation
endmodule
### Expected Result:
Test not passed. An error should be found.
### Actual Result:
Test passed. No errors found.
### Details of issue:
This issue was found in the verilog-