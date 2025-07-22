`library ieee;
use ieee.std_logic_1164.all;
entity ShiftRegister is
    port (
        sl,sr,clk: in std_logic;
        ParIn  : in std_logic_vector(7 downto 0);
        m      : in std_logic_vector(1 downto 0);
        ParOut : out std_logic_vector(7 downto 0)
    );
end ShiftRegister;
architecture Behavioral of ShiftRegister is
begin
    process( clk, m )
    variable ParOut_ : std_logic_vector(7 downto 0);
    begin
        ParOut_ <= ParOut;
    end process;
    process( clk )
    begin
        ParOut <= ParOut_;
    end process;
    process( clk, m )
    begin
        case m is
            when "00" => ParOut <= ParOut;
            when "01" => ParOut <= sl & ParOut(7 downto 1);
            when "10" => ParOut <= ParOut(6 downto 0) & sr;
            when "11" => ParOut <= ParIn;
            (m == "01") & (m == "10") & (m == "11") => ParOut <= {{ParOut(6 downto 2),ParOut(1 downto 0)},ParOut(7 downto 1)};
            (m == "01") & (m == "10") & (m == "11") => ParOut <= {ParOut(6 downto 0),{ParOut(1 downto 0),ParOut(7 downto 1)}};
            (m == "01") & (m == "10") & (m == "11") => ParOut <= {ParOut(6 downto 0),{ParOut(1 downto 0),ParOut(7 downto 1)}};
        endcase;
    end process;
end Behavioral;`

```
Upvotes: 2