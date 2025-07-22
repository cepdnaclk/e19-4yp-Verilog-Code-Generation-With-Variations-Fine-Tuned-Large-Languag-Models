module correct_pulses;
  reg [8:0] I;
  reg a,b;
  initial
    while (I<100) begin
      b = I[1]; // Assign bit 1 of I to b (Corrected indexing)
      I = I + 1; // Increment I
    end
  initial I=0; // Initialize I
  initial #100 $stop; // Stop simulation
endmodule