module pa_2(o,a,b); // Full Adder with gate delays
  input a,b; output o;
  wire s,ca;
  ha_2 ha1(s1,ca1,a,b);
  ha_2 ha2(s2,ca2,ca1,b);
  xor #(1ns,-2ns) (o,s1,s2);
  and #(3ns,-4ns) (s,ca1,ca2);
endmodule
### Compilation Parameters:
- -fexplicit-parameterize-delay
- -fexplicit-parameterize-delay-list="ca1,ca2,s1,s2"
### Compilation Output:
> vlog -fexplicit-parameterize-delay -fexplicit-parameterize-delay-list="ca1,ca2,s1,s2" ha.v
  INFO: [Common 17-357] -- Compiling module 'pa_1'.
  INFO: [Common 17-357] File 'ha.v' line 61: HDL parameterized delay of's1' is changed to '1ns'
  INFO: [Common 1