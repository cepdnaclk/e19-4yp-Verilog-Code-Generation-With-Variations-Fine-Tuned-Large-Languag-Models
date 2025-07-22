```vhdl
library ieee;
use ieee.std_logic_1164.all;
entity tst_mup is
end tst_mup;
architecture behav of tst_mup is
signal clk : std_logic;
signal en : std_logic;
signal int : std_logic;
component mup_opr is
end component;
signal rr : mup_opr (clk, int, en);
begin
initial
int<=0;clk<=0;en<=0;