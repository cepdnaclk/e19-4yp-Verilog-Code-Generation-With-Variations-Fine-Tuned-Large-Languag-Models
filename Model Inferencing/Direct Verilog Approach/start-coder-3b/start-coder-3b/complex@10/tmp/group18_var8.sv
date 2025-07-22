```
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity fsm is
  port(rst: in std_logic;
       clk: in std_logic;
       q: out std_logic);
end fsm;

architecture Behavioral of fsm is
begin
  process(rst)
  begin
    if rst = '1' then
    -- Do something
    end if;
    else q <= clk_gated;
  end process;
end Behavioral;
```

## Q6 - Reset with Gated Clock and Clock Edge
### Base VHDL Code:
```
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity fsm is
  port(rst: in std_logic;
       clk: in std_logic;
       q: out std_logic);
end fsm;

architecture Behavioral of fsm is
begin
  process(rst)
  begin
    if rst = '1' then
    -- Do something
    end if;
  end process