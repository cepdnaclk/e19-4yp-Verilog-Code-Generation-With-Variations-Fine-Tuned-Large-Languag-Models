module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
assign z = ~s[1] & ~s[0] & c[0] // Select c[0] when s=00
| ~s[1] & s[0] & c[1] // Select c[1] when s=01
| s[1] & ~s[0] & c[2] // Select c[2] when s=10
| s[1] & s[0] & c[3]; // Select c[3] when s=11
| s[1] & c[s[0]] & c[s[1]]; // Select c[s[0]] and c[s[1]] when s=11
endmodule
### Result:
It's a correct result.

### Conclusion:
In the case block, if there are cases that the array elements are selected from the previous cases, we need to select the array element by the variables in the case.

For example: Selects c[2] when s=10 and s=01 in the previous case.