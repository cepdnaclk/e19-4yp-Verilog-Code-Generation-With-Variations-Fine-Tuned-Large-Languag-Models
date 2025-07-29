module ha_2(s,ca,a,b); // Half Adder with gate delays
  input a,b; output s,ca;
  xor #(i.a,i.b) (s,a,b);
  and #(i.a,i.b) (ca,a,b);
  parameter signed struct {
    int a,b;
  } i = '{a:1,b:2};
endmodule
### Original Test Code:
module x1;
  wire a,b,s,ca;
  ha_1 u1(s,ca,a,b);
  initial begin
    a=0; b=0; #(10); a=1; b=0; #(10); a=0; b=1; #(10);
  end
endmodule
### Variation Test Bench:
module vtb;
  wire s,ca,a,b;
  ha_2 u1(s,ca,a,b);
  x1 u2(a,b,s,ca);
  initial begin
    $monitor("%t %b %b %b %d %d %d %d","",a,b,s,ca,u1.i.a,u1.i.b,u2.i.a,u2.i.b);
    a=0; b=0; #(10); a=1; b=0; #(10); a=0; b=1; #(10);
  end
endmodule
### Design Flow:
- Design -> Verify -> Synthesize -> Simulate
### Synopsis:
- Use signed type for delay values
- Define the value with parameter struct within the module
- Initialize the delay values within the module
- Verify by simulating the module
### Conclusion:
- Pass the delay values which are stored in a struct to an unpacked structure and use these values to assign delays for an input.
### Additional Readings:
-