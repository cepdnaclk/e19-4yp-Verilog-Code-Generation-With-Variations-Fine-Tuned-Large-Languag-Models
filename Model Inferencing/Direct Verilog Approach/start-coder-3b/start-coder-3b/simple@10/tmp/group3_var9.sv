module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output logic sum, cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule
### Output:
```
0       0       0       0       
1       1       0       0       
1       1       0       0       
0       1       0       0       
0       0       1       0       
1       0       0       0       
0       0       1       0       
1       0       0       0       
0       1       1       0       
1       1       1       0       
1       0       1       0       
0       1       1       0       
```