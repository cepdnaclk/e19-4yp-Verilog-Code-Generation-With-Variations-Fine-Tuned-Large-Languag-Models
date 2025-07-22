```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
  port (ArgA: in std_logic_vector(31 down 0);
        ArgB: in std_logic_vector(31 down 0);
        Clk: in std_logic;
        Result: out std_logic_vector(31 down