module pulses;
  reg [8:0] I;
  reg a,b;
  initial
    while (I<100) begin
      case (I[1:0]) // unique case
        inside[0]: a = 1;
        else:       a = 0; // Default value in case statement
      endcase // close case
      case (I[1:0]) // unique case
        inside[1]: b = 1;
        else:       b = 0; // Default value in case statement
      endcase // close case
      I = I + 1;
    end
  initial I=0;
  initial #100 $stop;
endmodule
### Simulated Waveform:
![Simulation Waveform](Simulation_Waveform.png)
### Simulated Transient:
![Simulation Transient](Simulation_Transient.png)
## 1.3.2
### Testbench:
```vhdl
library ieee;
use ieee.std_logic_1164.all;
entity tb_mux_2bit_4to1 is
end entity tb_mux_2bit_4to1;
architecture testbench of tb_mux_2bit_4to1 is
  signal s_a           : std_logic_vector(2 - 1 downto 0);
  signal s_b           : std_logic_vector(2 - 1 downto 0);
  signal s_c           : std_logic_vector(2 - 1 downto 0);
  signal s_d           : std_logic_vector(2 - 1 downto 0);
  signal s_sel         : std_logic_vector(2 - 1 downto 0);
  signal s_f           : std_logic_vector(2 - 1 downto 0);
begin
  uut_mux_2bit_4to1 : entity work.mux_2bit_4to1
    port map(
      a_i           => s_a,
      b_i           => s_b,
      c_i           => s_c,
      d_i           => s_d,
      sel_i         => s_sel,
      f_o           => s_f
    );
  p_stimulus : process
  begin
    s_a           <= "00"; wait for 100 ns;
    s_a           <= "01"; wait for 100 ns;
    s_a           <= "10"; wait for 100 ns;
    s_a           <= "11"; wait for 100 ns;
    s_b           <= "00"; wait for 100 ns;
    s_b           <= "01"; wait for 100 ns;
    s_b           <= "10"; wait for 100 ns;
    s_b           <= "11"; wait for 100 ns;
    s_c           <= "00"; wait for 100 ns;
    s_c           <= "01"; wait for 100 ns;
    s_c           <= "10"; wait for 100 ns;
    s_c           <= "11"; wait for 100 ns;
    s_d           <= "00"; wait for 100 ns;
    s_d           <= "01"; wait for 100 ns;
    s_d           <= "10"; wait for 100 ns;
    s_d           <= "11"; wait for 100 ns;
    s_sel         <= "00"; wait for 100 ns;
    s_sel         <= "01"; wait for 100 ns;
    s_sel         <= "10"; wait for 100 ns;
    s_sel         <= "11"; wait for 100 ns;
    wait;
  end process p_stimulus;
end architecture testbench;
```
### Base Verilog code:
```vhdl
library ieee;
use ieee.std_logic_1164.all;
entity mux_2bit_4to1 is
    port(
        a_i           : in  std_logic_vector(2 -