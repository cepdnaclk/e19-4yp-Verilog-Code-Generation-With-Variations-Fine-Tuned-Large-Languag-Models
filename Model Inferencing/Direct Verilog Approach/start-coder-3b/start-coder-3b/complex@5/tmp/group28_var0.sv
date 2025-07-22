```
initial
begin
d = state[0];
en = state[1];
end
always #4 en = state[1];
always #8 d = state[0];
...
### Testbench Code:
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.P0_P1.all;
entity tstdlatch is
end tstdlatch;
architecture Behavioral of tstdlatch is
component dlatch is port( d,en,q,qb: in std_ulogic; clk: in std_ulogic); end component;
dlatch #(.dl(4)) dlatch_a(clk,d,q,qb);
constant d_default : unsigned := x"00";
constant en_default : boolean := false;
signal state : state_t := (d_default,en_default);
end Behavioral;
### Testbench Code:
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.P0_P1.all;
entity tdlatch is
end tdlatch;
architecture Behavioral of tdlatch is
component dlatch is port( d,en,q,qb: in std_ulogic; clk: in std_ulogic); end component;
dlatch #(.dl(4)) dlatch_a(clk,d,q,qb);
signal state : state_t := (state_default,en_default);
begin
testbench : process is
variable i : integer;
begin
for i in 0 to 31 loop state <= (state_default, en_default); end loop; -- test 50 ns
wait for 65 ns; -- next 0 0
for i in 0 to 31 loop state <= (state_default, en_default); end loop; -- test 50 ns
wait for 65 ns; -- next 1 0
for i in 0 to 31 loop state <= (state_default, en_default); end loop; -- test 50 ns
wait for 95 ns; -- next 1 1
end process testbench;
end Behavioral;
```
### Output:
```
en = 0, d = 0, q = 0, qb = 0 

en = 0, d = 0, q = 0, qb = 0 

en = 0, d = 0, q = 0, qb = 0 

en = 0, d = 0, q = 0, qb = 0 

en = 0, d = 0, q = 0, qb = 0 

en = 0, d = 0, q = 0, qb = 0 

en = 0, d = 0, q = 0, qb = 0 

en = 0, d = 0, q = 0, qb = 0 

en = 0, d = 0, q = 0, qb = 0 

en = 0, d = 0, q = 0, qb = 0 

en = 0, d = 0, q = 0, qb = 0 

en = 0, d = 0, q = 0, qb = 0 

en = 0, d = 0, q = 0, qb = 0 

en = 0, d = 0, q = 0, qb = 0 

en = 0, d = 0, q = 0, qb = 0 

en = 0, d = 0, q = 0, qb = 0 

en = 0, d = 0, q = 0, qb = 0 

en = 0, d = 0, q = 0, qb = 0 

en = 0, d = 0, q = 0, qb = 0 

en = 0, d = 0, q = 0, qb = 0 

en = 0, d = 0, q = 0, qb = 0 

en = 0, d = 0, q = 0, qb = 0 

en = 1, d = 0, q = 0, qb = 0 

en = 1, d = 0, q = 0, qb = 0 

en = 1, d = 0, q = 0, qb = 0 

en = 1, d = 0, q = 1, qb = 0 

en = 1, d = 0, q = 1, qb = 0 

en = 1, d = 0, q = 1, qb = 0 

en = 1, d = 0, q = 0, qb = 0 

en = 1, d = 0, q = 1, qb = 0 

en = 1, d = 0, q = 1, qb = 0 

en = 1, d = 0, q = 0, qb = 0 

en = 1, d = 0, q = 0, qb = 0 

en = 1, d = 1, q = 0, qb = 0 

en = 1, d = 1, q = 0, qb = 0 

en = 1, d = 1, q = 0, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 0, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 0, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1, q = 1, qb = 0 

en = 1, d = 1,