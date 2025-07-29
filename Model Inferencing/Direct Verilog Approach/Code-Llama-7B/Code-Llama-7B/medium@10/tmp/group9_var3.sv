module pulses; // Corrected pulse generation
  reg [8:0] I[0:9];
  reg a,b;
  always_comb begin // Case-generation structure
    unique case(I[0:8]) inside // Case-generation inside