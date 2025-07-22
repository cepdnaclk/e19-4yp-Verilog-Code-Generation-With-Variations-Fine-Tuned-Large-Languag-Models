module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output sum, logic cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule
### Simulation Result:
![image](https://user-images.githubusercontent.com/30146819/38015951-4506078a-324f-11e8-8846-e1c535cb39c4.png)