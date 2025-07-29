module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output logic sum, cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule
### Simulation Logs:
To simulate,
```
cd path/of/base_verilog
iverilog *.v
vvp tb_full_adder
./a.out
```
### Testing
The module is verified by the testbench provided in the test.sv module. To simulate,
```
cd path/of/variant
iverilog *.v
vvp tb_full_adder
./a.out
```
### Explanation
The output cout, in the modified version, is of a different type. This is due to the verilog-2001 specs, in which output data types are by default wires. Thus, to assign a logic vector as an output, it must be explicitly declared a logic type.
### Compatibility:
This modification is compatible with the original code.
### Changes:
|Line Number|Changes Made|
|---|---|
|4|Declaring the output cout as a logic instead of wire|
|12|Assigning the sum as (i1 XOR i2 XOR cin) to compare it with the base code|
|13|Assigning the cout as (i1 AND i2) OR (cin AND (i1 OR i2))|
|20|Simulation of the module|
### Simulation Result:
#### base verilog
![](https://raw.githubusercontent.com/kusuushizu/HwVerilog/main/hw5/result/base_adder.png)
#### variant verilog
![](https://raw.githubusercontent.com/kusuushizu/HwVerilog/main/hw5/result/var_adder.png)

## Part C
### Base Verilog Code:
module n_bit_adder(a, b, cin, sum, cout);
input [10:0] a, b;
input cin