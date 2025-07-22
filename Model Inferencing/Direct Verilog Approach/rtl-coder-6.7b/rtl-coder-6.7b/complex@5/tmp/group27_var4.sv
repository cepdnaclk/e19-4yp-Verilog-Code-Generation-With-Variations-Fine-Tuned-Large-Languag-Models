module carry(cout, c, a, b);
input a, b, c;
output cout;
wire wc, wd;
assign wc = a & b;
assign wd = a ^ b;
assign cout = wc | ( c & wd);
endmodule
### Design Verification Commands:
```
$ ghdl -a test_carry.v
$ ghdl -e test_carry
$ ghdl -r test_carry --vcd=test_carry.vcd
$ gtkwave test_carry.vcd
```
### Screenshot:
![Screenshot (120)](https://user-images.githubusercontent.com/87767212/193574151-262d1a80-15b8-4258-8c39-c078bdb1663e.png)