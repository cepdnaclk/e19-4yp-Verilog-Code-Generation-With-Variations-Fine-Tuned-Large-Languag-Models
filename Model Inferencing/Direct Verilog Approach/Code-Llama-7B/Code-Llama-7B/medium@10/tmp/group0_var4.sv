module ha_9(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    (a, b *> s) = dl1;
    (a, b *> ca) = dl2;
  endspecify
  xor(s,a,b);
  and(ca,a,b);
endmodule
module dlx_9(s,a,b); // Design Library Xor
  input a,b; output s;
  ha_9 h0(s,a,b);
endmodule
module dlx_5(s,a,b); // Design Library And
  input a,b; output s;
  dlx_9 dlx0(s,a,b);
endmodule
module top(s,a,b);
  xor s;