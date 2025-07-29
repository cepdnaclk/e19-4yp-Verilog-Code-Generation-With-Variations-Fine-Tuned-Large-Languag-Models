module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output sum, cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
logic cout;
endmodule
### Listing of VHDL code:
architecture Behavioral of full_adder_vhdl is
begin
process (i1, i2, cin)
    variable temp: std_logic_vector(1 downto 0);
begin
    if (cin = '1') then
        temp := std_logic_vector(unsigned(std_logic_vector'("00" & i1 & i2)) + 1);
    else
        temp := std_logic_vector(unsigned(std_logic_vector'("00" & i1 & i2)));
    end if;
    o1 <= temp(0);
    o2 <= temp(1);
    cout <= temp(2);
end process;
end Behavioral;


### Testbench code:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_full_adder_1bit is
--  Port ( );
end tb_full_adder_1bit;

architecture Behavioral of tb_full_adder_1bit is
    component full_adder_vhdl
        port(
            i1 : in STD_LOGIC;
            i2 : in STD_LOGIC;
            cin : in STD_LOGIC;
            sum : out STD_LOGIC;
            cout : out STD_LOGIC
            );
    end component;
    
    signal i1: STD_LOGIC;
    signal i2: STD_LOGIC;
    signal cin: STD_LOGIC;
    signal sum: STD_LOGIC;
    signal cout: STD_LOGIC;
begin

    uut_full_adder : full_adder_vhdl
    port map (
        i1 => i1,
        i2 => i2