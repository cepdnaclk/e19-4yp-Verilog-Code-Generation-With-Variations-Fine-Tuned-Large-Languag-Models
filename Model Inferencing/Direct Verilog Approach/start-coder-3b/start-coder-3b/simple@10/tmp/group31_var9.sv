library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity func2 is
port (
x1 : in std_logic;
x2 : in std_logic;
x3 : in std_logic;
f : out std_logic_vector(1 downto 0)
);
end func2;

architecture Behavioral of func2 is
signal x1_ : std_logic_vector(1 downto 0) := x1;
signal x2_ : std_logic_vector(1 downto 0) := x2;
signal x3_ : std_logic_vector(1 downto 0) := x3;
begin
f <= std_logic_vector((not x1_ and not x2_ and x3_) or (not x1_ and x2_ and not x3_) or (x1_ and not x2_ and x3_) or (x1_ and x2_ and not x3_));
exception
end Behavioral;
### Results:
This will generate 256 possible function results and 256 possible input combinations.  Note that if we add another input, we will still only