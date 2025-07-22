module andfr_tst(DIn, DOut); // Testbench for OR gate with force/release
  reg b,c; wire a;

  // Inputs and outputs to be packed into a structure
  struct packed_data_in {logic f0; logic f1; logic f2; logic f3; logic f4; logic f5; logic f6; logic f7;} DIn;
  struct packed_data_in DIn_f;
  struct packed_data_in DIn_r;
  struct packed_data_out {logic f0; logic f1; logic f2; logic f3; logic f4; logic f5; logic f6; logic f7;} DOut;

  // Pack the inputs into a structure
  assign DIn_f.f0 = DIn.f0;
  assign DIn_f.f1 = DIn.f1;
  assign DIn_f.f2 = DIn.f2;
  assign DIn_f.f3 = DIn.f3;
  assign DIn_f.f4 = DIn.f4;
  assign DIn_f.f5 = DIn.f5;
  assign DIn_f.f6 = DIn.f6;
  assign DIn_f.f7 = DIn.f7;

  assign DIn_r.f0 = DIn.r0;
  assign DIn_r.f1 = DIn.r1;
  assign DIn_r.f2 = DIn.r2;
  assign DIn_r.f3 = DIn.r3;
  assign DIn_r.f4 = DIn.r4;
  assign DIn_r.f5 = DIn.r5;
  assign DIn_r.f6 = DIn.r6;
  assign DIn_r.f7 = DIn.r7;

  // Instantiate the module containing force/release
  and_fr_rl dd(a,b,c,DIn_f,DIn_r,DOut);
endmodule
### Expected Results:
All outputs should be logic 1.

---

## Task 5