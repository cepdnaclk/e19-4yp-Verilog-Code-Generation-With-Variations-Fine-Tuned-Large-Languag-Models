module ha_8(s,ca,a,b); // Half Adder
  input a,b; output s,ca;
  wire [3:0] tmp;
  if (tmp[3:2] inside {2'b10, 2'b11}) begin: insiderange
    logic a1,b1;
    logic s1,ca1;
    xor (s1,a1,b1);
    and (ca1,a1,b1);
  end
  else begin
    logic s2,ca2;
    xor (s2,a,b);
    and (ca2,a,b);
  end
  assign {s,ca} = {s2,ca2};
endmodule
### Output:
The output is a half adder that has a delay of 2 for the output s if the two input bits are 10 or 11.