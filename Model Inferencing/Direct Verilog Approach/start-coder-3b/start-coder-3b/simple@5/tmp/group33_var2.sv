module ha_1(s,ca,a,b); // Half Adder with gate delays
  input a,b; output s,ca;
  xor #(1,2) (s,a,b);
  and #(3,4) (ca,a,b);
endmodule
### Notes:
1. The unpacked structure has to be declared at the top of the code file.
2.