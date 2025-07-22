module or_fr_rl_unpacked (DataIn, DataOut);
  logic [3:0] a, b, c; // Input signals are unpacked
  // Output signal will be a string to indicate the state of the input signals
  string [8] output; // Output signal is a string

  logic f_a, r_a;
  logic f_b, r_b;
  logic f_c, r_c;
  logic s_a, s_b, s_c; // Forces and releases are unpacked
  logic f, r;

  always_ff @(posedge f or posedge r) begin
      if (f) f_a <= a;
      if (f) f_b <= b;
      if (f)