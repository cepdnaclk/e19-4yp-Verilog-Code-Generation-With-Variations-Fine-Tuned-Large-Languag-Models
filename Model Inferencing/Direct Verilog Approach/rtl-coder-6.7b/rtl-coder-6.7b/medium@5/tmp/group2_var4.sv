module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;

reg [2:0] ind = 0;
reg [2:0] arr_packed[3];

always @(posedge Clock)
begin
    arr_packed[ind[0]] <= D;
    arr_packed[ind[1]] <= arr_packed[ind[0]];
    ind[2] <= ind[1];
    ind[1] <= ind[0];
    ind[0] <= 2'd0;
end

endmodule
### Generated Verilog Code:
(I/O)    Q1       Q2
Clock    x        x
D        x        x
### VHDL Code:
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity example7_4 is
port (
    D, Clock: in std_logic;
    Q1, Q2: out std_logic
);
end example7_4;

architecture Behavioral of example7_4 is

begin

end Behavioral;
### Altera Quartus Prime VHDL Code:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity example7_4 is
port (
    D, Clock: in STD_LOGIC;
    Q1, Q2: out STD_LOGIC
);
end entity example7_4;

architecture Behavioral of example7_4 is

begin

end Behavioral;
### ISE FPGA Verilog Code:
module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;

always @(posedge Clock)
begin
    Q1 <= D;
    Q2 <==(Q1? Q1 : D);
end
endmodule
### Altera Quartus Prime Verilog Code:
module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;

always @(posedge Clock)
begin
    Q1 <= D;
    Q2 <= D;
    Q2 <= Q1;
end
endmodule
### ISE FPGA VHDL Code:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity example7_4 is
port (
    D, Clock: in STD_LOGIC;
    Q1, Q2: out STD_LOGIC
);
end entity example7_4;

architecture Behavioral of example7_4 is

begin

end Behavioral;
### Xilinx Vivado Verilog Code:
module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;

always @(posedge Clock)
begin
    Q1 <= D;
    Q2 <= Q1? Q1 : D;
end
endmodule
### Xilinx Vivado VHDL Code:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity example7_4 is
port (
    D, Clock: in STD_LOGIC;
    Q1, Q2: out STD_LOGIC
);
end entity example7_4;

architecture Behavioral of example7_4 is

begin

end Behavioral;
### Intel FPGA Code:
module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;

always @(posedge Clock)
begin
    Q1 <= D;
    Q2 <= D;
    Q2 <= Q1;
end
endmodule