module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output sum, logic cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule
### Output:
![image](https://user-images.githubusercontent.com/29741778/141241651-ee6807bc-f0de-4150-81d7-b818f75b84b3.png)
![image](https://user-images.githubusercontent.com/29741778/141241662-b2c56b3b-f740-425e-ab56-d02b5b057d24.png)
### Output Explaination:
The output result was a warning.
![image](https://user-images.githubusercontent.com/29741778/141241779-0f7b2ad1-618e-4dcc-b185-e7a120227681.png)