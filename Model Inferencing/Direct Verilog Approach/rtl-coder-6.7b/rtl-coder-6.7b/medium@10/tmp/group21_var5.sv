module tst_nm_in();
  reg in; wire out;
  NMOSinv nmv(out,in); // Instantiate NMOS inverter
  initial
    in =1'b1; // Start with input high -> output low
  always
    case ({in,out})
      2'b00: in=1'b0;
      2'b01: in=1'b0;
      2'b10: in=1'b1;
      2'b11: in=1'b1;
    endcase
  initial $monitor($time, " in = %b, output = %b ",in,out);
  initial #10 $stop; // Stop simulation
endmodule
### Variation Transcript:
###