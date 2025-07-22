module tst_alu4();
  reg [3:0]a,b; reg[1:0] f; reg cci; logic[3:0]d; logic co;
  alu_4 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus with #3 delay
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule
### Output:
`timescale 1ns/1ns
tst_alu4:20: cci = 0, a= 0,b = 0,f = 00,d = 0,co= 0
tst_alu4:30: $stop
### Error:
Error (vsim-3425): DV/SL: Assertion check failure: Tests/tst_alu4.v(86):(always0) expected 1'b0 === 1'b1
vsim-3425: Tests/tst_alu4.v(86): (always0) Failure: Assertion check failure:
1'b0 === 1'b1
Time: 0 ns  Iteration: 0  Instance: /tst_alu4 File: Tests/tst_alu4.v