library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tstdlatch is
port(
 d : in std_logic;
 en : in std_logic;
 q : out std_logic;
 qb : out std_logic
);
end tstdlatch;
architecture Behavioral of tstdlatch is
signal en,q,qb : std_logic;
begin
en <= '0';
process
begin
if en = '0' then
d <= '0';
else
d <= '1';
end if;
end process;
process
begin
if en = '0' then
q <= '0';
else
q <= d;
end if;
end process;
qb <= q;
end Behavioral;