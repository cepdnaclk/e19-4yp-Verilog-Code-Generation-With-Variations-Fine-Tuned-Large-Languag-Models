module struct_ha_1(s,ca,a,b);
  input a,b; output s,ca;
  wire c;
  xor #(a.a1,a.a2) (s,a,b);
  and #(b.a1,b.a2) (c,a,b);
  or #(c.a