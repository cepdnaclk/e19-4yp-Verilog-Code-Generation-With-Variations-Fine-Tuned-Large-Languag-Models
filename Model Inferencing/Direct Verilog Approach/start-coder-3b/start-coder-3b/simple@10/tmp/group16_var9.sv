module xor_fr_rl; // Data Flow Control Module with Force and Release
  input a,b;
  input c;
  output o;
  wire a_f;
  wire a_r;
  unpacked struct dIn {logic a,b,c; logic [7:0] f,r;} dIn;
  unpacked struct dOut {logic a,b,c; logic [7:0] f,r;} dOut;
  dataIn dIn; dataOut dOut;
  dIn.a = 1'b0; dIn.a = 1'b1; dIn.c = 1'b1; dIn.f = 102; dIn.r = 204;
  dOut.f = dIn.f; dOut.r = dIn.r;
  xor_fr_rl xor (
   .a(dIn),
   .b(dIn),
   .c(dIn),
   .o(o),
   .a_f(a_f),
   .a_r(a_r)
  );
  force a_f;
  release a_r;
  force b_f;
  release b_r;
  force c_f;
  release c_r;
  initial a_f = '1;
  initial a_r = '0;
  initial b_f = '1;
  initial b_r = '0;
  initial c_f = '1;
  initial c_r = '0;

endmodule

## 5.10.12.5. mux_fr_rl

### Base Verilog Code:
module mux_fr_rl;
  input a,b;
  input c;
  output o;
  localparam f = 102;
  localparam r = 204;
  wire a_f;
  wire a_r;
  wire b_f;
  wire b_r;
  wire c_f;
  wire c_r;
  mux_fr_rl mux_fr (
   .a(a),
   .b(b),
   .c(c),
   .o(o),
   .a_f(a_f),
   .a_r(a_r),
   .b_f(b_f),
   .b_r(b_r),
   .c_f(c_f),
   .c_r(c_r)
  );
  force a_f;
  release a_r;
  force b_f;
  release b_r;
  force c_f;
  release c_r;
  initial a_f = '1;
  initial a_r = '0;
  initial b_f = '1;
  initial b_r = '0;
  initial c_f = '1;
  initial c_r = '0;

endmodule
### Variation Instruction:
Change DataIn