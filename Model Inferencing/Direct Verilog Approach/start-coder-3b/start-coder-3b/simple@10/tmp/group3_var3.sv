module binary_subtracter(a, b, cout, sum);
input [7:0] a, b;
output logic cout, sum;
assign sum = a - b;
assign cout = (sum < 256);
endmodule
### Test:
![Binary Subtracter Test](../Images/Binary_Subtracter_Test.png)
### Results:
![Binary Subtracter Results](../Images/Binary_Subtracter_Results.png)

# Part 5: Using the RTL Simulator to test components and modules in VHDL
## 5.1: Using the RTL simulator to test the full adder, which has the inputs a, b, cin, and outputs sum, and cout.
### Testbench Code:
module tb_fulladder is

endmodule

### RTL Code:
module full_adder(a, b, cin, cout, sum);
input [3:0] a, b, cin;
output [3:0] cout, sum;
assign cout = (a ^ b ^ cin);
assign sum = a ^ b ^ cin;
endmodule

### Test:
![Full Adder Testbench](../Images/Full_Adder_Testbench.png)
### Results:
![Full Adder Results](../Images/Full_Adder_Results.png)

## 5.2: Using the RTL simulator to test the full adder, which has the inputs a, b, cin, and outputs sum, and cout.
### Testbench Code:
module tb_fulladder is

endmodule

### RTL Code:
module full_adder(a, b, cin, cout, sum);
input [3:0] a, b, cin;
output [3:0] cout, sum;
assign cout = (a ^ b ^ cin);
assign sum = a ^ b ^ cin;
endmodule

### Test:
![Full Adder Testbench](../Images/Full_Adder_Testbench_T2.png)
### Results:
![Full Adder Results](../Images/Full_Adder_Results_T2.png)

## 5.3: Using the RTL simulator to test the full adder, which has the inputs a, b, cin, and outputs sum, and cout.
### Testbench Code:
module tb_fulladder is

endmodule

### RTL Code:
module