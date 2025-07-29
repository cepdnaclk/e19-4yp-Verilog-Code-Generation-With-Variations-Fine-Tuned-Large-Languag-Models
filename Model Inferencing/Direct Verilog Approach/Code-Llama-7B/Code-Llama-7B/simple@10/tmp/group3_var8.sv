module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output logic sum, cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule
### Simulation:
#### Without Modification
![image](https://user-images.githubusercontent.com/11408159/28170284-5c1883e6-683f-11e7-935e-1f1799284476.png)

#### With Modification
![image