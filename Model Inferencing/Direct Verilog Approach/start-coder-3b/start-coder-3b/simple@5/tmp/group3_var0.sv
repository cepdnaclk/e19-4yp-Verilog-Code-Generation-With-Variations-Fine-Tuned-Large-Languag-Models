module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output logic sum, cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule
### Verilog Code Tested in:
Icarus Verilog 11.5
### Testing Results:

![1](https://github.com/Mokrusha/Computer-Architecture/blob/main/FullAdder/1.PNG)

![2](https://github.com/Mokrusha/Computer-Architecture/blob/main/FullAdder/2.PNG)

![3](https://github.com/Mokrusha/Computer-Architecture/blob/main/FullAdder/3.PNG)

## Full Adder Code-2 (Binary to Decimal)
### Base Verilog Code:
module full_adder_dec(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, c, x, carryout);
input a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, c;
output x, carryout;
wire x1,x2,x3,x4,x5,x6,x7,x8;
assign x7= a0 ^ a1 ^ a2 ^ a3 ^ a4 ^ a5 ^ b0 ^ b1 ^ b2 ^ b3 ^ b4 ^ b5 ^ c^1;
assign x6= (a0 & a1 & c ) | (a2 & a3 & c) | (a4 & a5 & c) | (b0 & b1 & c) | (b2 & b3 & c) | (b4 & b5 & c) | c;
assign x5= (a0 & a1 & a2 & a3 & b4 & b5 & c) | (a4 & a5 & b0 & b1 & b2 & b3 & b4 & b5 & b6 & c);
assign x4= (a0 & a1 & a2 & a3 & a4 & b5 & b6 & c) | (a5 & b0 & b1 & b2 & b3 & b4 & b5 & b6 & c);
assign x3= (a0 & a1 & a2 & a3 & b0 & b1 & b2 & b3 & b4 & b5 & c) | (a4 & a5 & b6 & c);
assign x2= (a0 & a1 & a2 & a3 & a4 & a5 & b0 & b1 & b2 & b3 & b4 & b5 & c);
assign x1= (a0 & a1 & a2 & a3 & b0 & b1 & b2 & b3 & b4 & b5 & b6 & b7 & c^1);
assign x8= (a0 & a1 & c ) | (a2 & a3 & c) | (a4 & a5 & c) | (b0 & b1 & c) | (b2 & b3 & c) | (b4 & b5 & c) | c;
assign x7= (a0 & a1 & a2 & a3 & b4 & b5 & c) | (a4 & a5 & b0 & b1 & b2 & b3 & b4 & b5 & b6 & c);
assign x6= (a0 & a1 & a2 & a3 & a4 & b5 & b6 & c) | (a5 & b0 & b1 & b2 & b3 & b4 & b5 & b6 & c);
assign x5= (a0 & a1 & a2 & a3 & b0 & b1 & b2 & b3 & b4 & b5 & c) | (a4 & a5 & b6 & c);
assign x4= (a0 & a1 & a2 & a3 & a4 & a5 & b0 & b1 & b2 & b3 & b4 & b5 & c);
assign x3= (a0 & a1 & a2 & a3 & b0 & b1 & b2 & b3 & b4 & b5 & b6 & b7 & c^1);
assign x2= (a0 & a1 & a2 & a3 & b0 & b1 & b2 & b3 & b4 & b5 & c);
assign x1= (a0 & a1 & c ) | (a2 & a3 & c) | (a4 & a5 & c) | (b0 & b1 & c) | (b2 & b3 & c) | (b4 & b5 & c) | c;
assign x8= (a0 & a1 & c ) | (a2 & a3 & c) | (a4 & a5 & c) | (b0 & b1 & c) | (b2 & b3 & c) | (b4 & b5 & c) | c;
assign x7= (a0 & a1 & a2 & a3 & b4 & b5 & c) | (a4 & a5 & b0 & b1 & b2 & b3 & b4 & b5 & b6 & c);
assign x6= (a0 & a1 & a2 & a3 & a4 & b5 & b6 & c) | (a5 & b0 & b1 & b2 & b3 & b4 & b5 & b6 & c);
assign x5= (a0 & a1 & a2 & a3 & b0 & b1 & b2 & b3 & b4 & b5 & c) | (a4 & a5 & b6 & c);
assign x4= (a0 & a1 & a2 & a3 & a4 & a5 & b0 & b1 & b2 & b3 & b4 & b5 & c);
assign x3= (a0 & a1 & a2 & a3 & b0 & b1 & b2 & b3 & b4 & b5 & b6 & b7 & c^1);
assign x2= (a0 & a1 & a2 & a3 & b0 & b1 & b2 & b3 & b4 & b5 & c);
assign x1= (a0 & c ) | (a2 & c) | (a4 & c) | (b0 & c) | (b2 & c) | (b4 & c) | c;
assign x8= (a0 & c ) | (a2 & c) | (a4 & c) | (b0 & c) | (b2 & c) | (b4 & c) | c;
assign x7= (a0 & a1 & b4 & b5 & c) | (a4 & a5 & b0 & b1 & b2 & b3 & b4 & b5 & b6 & c);
assign x6= (a0 & a1 & a2 & a3 & a4 & b5 & b6 & c) | (a5 & b0 & b1 & b2 & b3 & b4 & b5 & b6 & c);
assign x5= (a0 & a1 & a2 & a3 & b0 & b1 & b2 & b3 & b4 & b5 & c) | (a4 & a5 & b6 & c);
assign x4= (a0 & a1 & a2 & a3 & a4 & a5 & b0 & b1 & b2 & b3 & b4 & b5 & c);
assign x3= (a0 & a1 & a2 & a3 & b0 & b1 & b2 & b3 & b4 & b5 & b6 & b7 & c^1);
assign x2= (a0 & a1 & a2 & a3 & b0 & b1 & b2 & b3 & b4 & b5 & c);
assign x1= (a0 & c ) | (a2 & c) | (a4 & c) | (b0 & c) | (b2 & c) | (b4 & c) | c;
assign x8= (a0 & c ) | (a2 & c) | (a4 & c) | (b0 & c) | (b2 & c) | (b4 & c) | c;
assign x7= (a0 & a1 & b4 & b5 & c) | (a4 & a5 & b0 & b1 & b2 & b3 & b4 & b5 & b6 & c);
assign x6= (a0 & a1 & a2 & a3 & a