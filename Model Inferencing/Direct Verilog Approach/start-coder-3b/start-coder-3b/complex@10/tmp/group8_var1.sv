module t_Johnson_Counter ();
wire [3: 0] count;
reg enable;
reg clock, reset;
generate
for (i=0; i<4; i=i+1)
Johnson_Counter M0 (count[i], enable, clock, reset);
endgenerate
endmodule

### Results:
1. Johnson Counter:

```
$ vvp t_Johnson_Counter
$ gtkwave Johnson_Counter_Simulation.vcd
```

2. Johnson Counter:

```
$ vvp t_Johnson_Counter
$ gtkwave Johnson_Counter_Simulation.vcd
```

## 10.34 Johnson Counter VHDL Codes

### Base VHDL Codes:
`Johnson_Counter`

```
library ieee;
use ieee.std_logic_1164.all;
entity Johnson_Counter is
port(
count: out std_logic_vector (3 downto 0);
enable : in std_logic;
clock: in std_logic;
reset : in std_logic);
end Johnson_Counter;
architecture Behavioral of Johnson_Counter is
signal count : std_logic_vector (3 downto 0):= (others =>'0');
begin
process(clock,reset)
begin
if reset = '1' then
count <= (others => '0');
elsif enable = '1' then
case count is
when "0000" => count <= "0001";
when "0001" => count <= "0011";
when "0011" => count <= "0111";
when "0111" => count <= "1111";
when "1111" => count <= "1110";
when "1110" => count <= "1100";
when "1100" => count <= "1000";
when others => count <= "0000";
end case;
end if;
end process;
end Behavioral;
```
`t_Johnson_Counter`

```
library ieee;
use ieee.std_logic_1164.all;
entity t_Johnson_Counter is
end t_Johnson_Counter;
architecture Behavioral of t_Johnson_Counter is
component Johnson_Counter is
port (
count: out std_logic_vector (3 downto 0);
enable : in std_logic;
clock: in std_logic;
reset : in std_logic);
end component;
signal count : std_logic_vector (3 downto 0):= (others =>'0');
signal enable: std_logic := '0';
signal clock: std_logic := '0';
signal reset : std_logic := '0';
begin
johnson_counter: Johnson_Counter port map(count, enable, clock, reset);
process
begin
wait for 500 ns;
clock <= not clock;
end process;
end behavioral;
```

### Results:
1. Johnson Counter:

```
$ ghdl -a Johnson_Counter.vhdl
$ ghdl -e Johnson_Counter
$ ghdl -r Johnson_Counter --stop-time=100000ns --wave=Johnson_Counter_Simulation.ghw
$ gtkwave Johnson_Counter_Simulation.ghw
```

2. Johnson Counter:

```
$ ghdl -a Johnson_Counter.vhdl
$ ghdl -e Johnson_Counter
$