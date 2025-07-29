module tst_alu1();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d; wire co;
  alu_1 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial  begin cci=1'b0; a=4'h0; b=4'h0; f=2'b00; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
     a=4'h1; #2 a=4'h3; #2 a=4'h5; #2 a=4'h0; #2 a=4'h6; #2 a=4'h8; #2 a=4'h9; #2 a=4'hA; #2 a=4'hB; #2 a=4'hC; #2 a=4'hD; #2 a=4'hE; #2 a=4'hF; #2 a=4'h0; #2 a=4'h0; #2 a=4'h0; #2 a=4'h0; #2 a=4'h0; #2 a=4'h0; #2 a=4'h0; #2 a=4'h0; #2 a=4'h0; #2 a=4'h0; #2 a=4'h0; #2 a=4'h0; #2 a=4'h0; #2 a=4'h0; #2 a=4'h0; #2 a=4'h0;
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule
### Verification
1. You can see in the figure above, the output of the ALU logic behaves as expected.

### Analysis
1. Notice that we also changed the initialization of the ALU so that the control inputs are zero (i.e. `f=2