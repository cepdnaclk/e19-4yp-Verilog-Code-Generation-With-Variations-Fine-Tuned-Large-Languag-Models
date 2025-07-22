module alu_1(d,co,a,b,f,cci); // Declare alu_1
  input [3:0]a,b; input [1:0] f; input cci; output [3:0]d; output co;
  wire c0,c1,c2,c3,c4,c5,c6,c7; // Declare c0 - c7
  assign c0 = (f == 2'b00)? 1'b0 : (f == 2'b01)? 1'b1 :
  (f == 2'b10)? a[0] : 1'b0;
  assign c1 = (f == 2'b00)? 1'b0 : (f == 2'b01)? 1'b1 : (f == 2'b10)?
  a[1] : 1'b0;
  assign c2 = (f == 2'b00)? 1'b0 : (f == 2'b01)? 1'b1 : (f == 2'b10)?
  a[2] : 1'b0;
  assign c3 = (f == 2'b00)? 1'b0 : (f == 2'b01)? 1'b1 : (f == 2'b10)?
  a[3] : 1'b0;
  assign c4 = (f == 2'b00)? 1'b0 : (f == 2'b01)? 1'b1 : (f == 2'b10)?
  b[0] : 1'b0;
  assign c5 = (f == 2'b00)? 1'b0 : (f == 2'b01)? 1'b1 : (f == 2'b10)?
  b[1] : 1'b0;
  assign c6 = (f == 2'b00)? 1'b0 : (f == 2'b01)? 1'b1 : (f == 2'b10)?