module test_full_adder(a,b,cin,sum,cout);
input a,b,cin;
output logic sum, cout;
module full_adder(a, b, c, sum, cout);
input a,b,c;
output logic sum, cout;
assign sum = a ^ b ^ c;
// assign cout = (a & b) | (c & (a | b));
assign cout = (a & b) | (c & (a | b));
endmodule
endmodule
### Simulation Log:
The circuit is designed for Xilinx 7-Series FPGA.
The modified circuit is able to support 8-bit width.
Test result is below:
![alt text](https://raw.githubusercontent.com/liuhuichen/SystemVerilog_Verilog_Verilog_HDL/master/1/1.png)
The test result shows that the modified circuit is correct and the logic-vector feature of SystemVerilog is working.