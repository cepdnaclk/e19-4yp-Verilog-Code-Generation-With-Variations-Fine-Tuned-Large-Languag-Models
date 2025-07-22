```
module ha_2_packed(s,ca,a,b); // Half Adder with gate delays
  input bit [0:3] a,b; output bit [0:3] s,ca;
  and #(3,4) (ca,a,b);
  ha_1_packed #(3,4) s_1(s[0:3],ca,a,b);
endmodule
```
### Input and Output Files:
```
module ha_2_packed(s,ca,a,b); // Half Adder with gate delays
  input bit [0:3] a,b; output bit [0:3] s,ca;
  and #(3,4) (ca,a,b);
  ha_1_packed #(3,4) s_1(s[0:3],ca,a,b);
endmodule
```
### Output File:
```
module ha_2_packed(s,ca,a,b); // Half Adder with gate delays
  input bit [0:3] a,b; output bit [0:3] s,ca;
  and #(3,4) (ca,a,b);
  ha_1_packed #(3,4) s_1(s[0:3],ca,a,b);
endmodule
```
### Design Report:
![Design Report](ha_2_design.png)
### Verilator Output:
```
Module ha_2_packed
   .(.a(a[0]),.b(a[1]),.s(s[0]),.ca(ca));
   .(.a(a[1]),.b(a[2]),.s(s[1]),.ca(ca));
   .(.a(a[2]),.b(a[3]),.s(s[2]),.ca(ca));
   .(.a(a[3]),.b(a[0]),.s(s[3]),.ca(ca));
    ha_1_packed #(3'h3, 3'h4) s_1(.a(a[0]),.b(a[1]),.s(s[0]),.ca(ca));
    ha_1_packed #(3'h3, 3'h4) s_1(.a(a[1]),.b(a[2]),.s(s[1]),.ca(ca));
    ha_1_packed #(3'h3, 3'h4) s_1(.a(a[2]),.b(a[3]),.s(s[2]),.ca(ca));
    ha_1_packed #(3'h3, 3'h4) s_1(.a(a[3]),.b(a[0]),.s(s[3]),.ca(ca));
```
### Simulation Output:
```
time: 0 ns  (100.00% cpu)
time: 1 ps  (100.00% cpu)
s[0]: 0
s[1]: 1
s[2]: 0
s[3]: 1
```
### Testbench Output:
```
$./tb_ha_2_packed
Read file to memory..
Writing 12 bytes to memory..
Initializing Verilator.
Running simulation for 100 ps with a clock period of 1 ps..
Running simulation for 100 ps with a clock period of 1 ps..
s[0]: 0
s[1]: 1
s[2]: 0
s[3]: 1
```
### Notes:
Modifying the parameterized delays in the original example did not require changing the output of the testbench. The same arrays containing packed signed values are being passed as inputs to the ha_1 module and the s and ca outputs from this module are being passed as inputs to the ha_2_packed module.

# ha_1_v2
### Base Verilog Code:
module ha_1(s,ca,a,b); // Half Adder with gate delays
  input a,b; output s,ca;
  xor #(1,2) (s,a