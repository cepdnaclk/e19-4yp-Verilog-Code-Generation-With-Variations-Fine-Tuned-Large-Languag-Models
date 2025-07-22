module ha_1(s,ca,a,b); // Half Adder with delays driven by values
  parameter delay = '{1,2,3,4}, // delay values
            delay_s = delay[0],
            delay_ca = delay[2];
  input a,b; output s,ca;
  xor #(delay_s) (s,a,b);
  and #(delay_ca) (ca,a,b);
endmodule
### Result:
Module ha_1 was compiled.