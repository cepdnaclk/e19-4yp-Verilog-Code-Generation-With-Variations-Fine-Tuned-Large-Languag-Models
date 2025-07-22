// module mux41b (
// input wire [3:0] c,
// input wire [1:0] s,
// output wire z
// );
// assign z = ~s[1] & ~s[0] & c[0] // Select c[0] when s=00
// | ~s[1] & s[0] & c[1] // Select c[1] when s=01
// | s[1] & ~s[0] & c[2] // Select c[2] when s=10
// | s[1] & s[0] & c[3]; // Select c[3] when s=11
// endmodule
### Results:
The following code shows the result of the Verilog code after modifying it with the variation instruction.
![1](https://user-images.githubusercontent.com/77528716/117396990-f1d35380-af08-11eb-9017-4b881607f57a.png)
The variation instruction causes the input and output data to be different between the old and new code.
# Verilog/VHDL Code Explanation and Description
## Instruction
Write a VHDL code to find out the parity of a binary number. That is, if the number has even number of ones, it outputs 0, otherwise it outputs 1. The input number will be given in 8 bits, and the output will be 1 bit.
## Base Code:
module par (
input [7:0] d,
output p
);

assign p = d[0] ^ d[1] ^ d[2] ^ d[3] ^ 
d[4] ^ d[5] ^ d[6] ^ d[7];

endmodule
## Modified Code:
module par (
input [7:0] d,
output p
);

//assign p = d[0] ^ d[1] ^ d[2] ^ d[3] ^ 
//d[4] ^ d[5] ^ d[6] ^ d[7]; // Even Parity

//assign p = d[0] | d[1] | d[2] | d[3] | 
//d[4] | d[5] | d[6] | d[7]; // Odd Parity

//assign p = d[0] & d[1] & d[2] & d[3] & 
//d[4] & d[5] & d[6] & d[7]; // 0 Parity

//assign p = d[0] ^ d[1] ^ d[2] ^ d[3] ^ 
//d[4] ^ d[5] ^ d[6] ^ d[7]; // 1 Parity

endmodule
## Results:
The following code shows the result of the VHDL code after modifying it with the variation instruction.
![2](https://user-images.githubusercontent.com/77528716/117229678-c3ba2c80-ae05-11eb-8a70-9cd8a52860d9.png)
The variation instruction causes the input and output data to be different between the old and new code.
# Verilog/VHDL Code Explanation and Description
## Instruction
Write a Verilog code to multiplex two input signals using 4-1 Selector.
## Base Verilog Code:
module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
assign z = ~s[1] & ~s[0] & c[0] // Select c[0] when s=00
| ~s[1] & s[0] & c[1] // Select c[1] when s=01
| s[1] & ~s[0] & c[2] // Select c[2] when s=10
| s[1] & s[0] & c[3]; // Select c[3] when s=11
endmodule
## Variation Instruction:
Add a case block with inside testing array elements selected by dynamic variable index.
## Modified Code:
module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
assign z = ~s[1] & ~s[0] & c[0] // Select c[0] when s=00
| ~s[1] & s[0] & c[1] // Select c[1] when s=01
| s[1] & ~s[0] & c[2] // Select c[2] when s=10
| s[1] & s[0] & c[3]; // Select c[3] when s=11
endmodule
## Results:
The following code shows the result of the Verilog code after modifying it with the variation instruction.
![1](https://user-images.githubusercontent.com/77528716/117396990-f1d35380-af08-11eb-9017-4b881607f57a.png)
The variation instruction causes the input and output data to be different between the old and new code.
# Verilog/VHDL Code Explanation and Description
## Instruction
Write a Verilog code to extract a particular range of bits from an input integer. 
## Base Verilog Code:
module extract (
input wire [15:0] x,
input wire [3:0] b,
output wire [3:0] y
);

assign y[0] = x[15];
assign y[1] = x[13];
assign y[2] = x[11];
assign y[3] = x[9];

endmodule
## Variation Instruction:
Use the input and output signal as a condition to extract the particular range of bits from an input integer.
## Modified Code:
module extract (
input wire [15:0] x,
input wire [3:0] b,
output wire [3:0] y
);

assign y = x[b + 1];

endmodule
## Results:
The following code shows the result of the Verilog code after modifying it with the variation instruction.
![1](https://user-images.githubusercontent.com/77528716/117396990-f1d35380-af08-11eb-9017-4b881607f57a.png)
The variation instruction causes the input and output data to be different between the old and new code.
# Verilog/VHDL Code Explanation and Description
## Instruction
Write a VHDL code to calculate the arithmetic result of two input BCD numbers.
## Base VHDL Code:
library ieee;
use ieee.std_logic_1164.all;

entity add8 is
port(
a, b: in std_logic_vector(7 downto 0);
cout: out std_logic_vector(7 downto 0);
sum: out std_logic_vector(7 downto 0);
);
end add8;

architecture ari of add8 is
signal carry: std_logic_vector(7 downto 0);
begin
carry <= "00000000";
for i in 0 to 7 generate
sum(i) <= ((a(i) or b(i)) and carry) xor (a(i) nand b(i)) or (a(i) xor b(i) and carry);
carry(i) <= ((a(i) or b(i)) and carry) or (a(i) nand b(i)) or (a(i) and b(i));
end generate;
end ari;
## Modified VHDL Code:
library ieee;
use ieee.std_logic_1164.all;

entity add8 is
port(
a, b: in std_logic_vector(7 downto 0);
cout: out std_logic_vector(7 downto 0);
sum: out std_logic_vector(7 downto 0);
);
end add8;

architecture ari of add8 is
signal carry: std_logic_vector(7 downto 0);
--signal temp: std_logic_vector(7 downto 0);
begin
carry <= "00000000";
--temp <= "10000000";
for i in 0 to 7 generate
--sum(i) <= carry xor a(i) xor b(i);
sum(i)