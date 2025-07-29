```
module latch (input d, c, output q, q_b );
union u { reg [7:0] q_b; reg q; }
union u_d;
always begin
wait ( c );
u_d.q_b = d;
q_b = u_d.q_b;
q = u_d.q;
end
endmodule
```
### Listing of VHDL code:
```
architecture Behavioral of latch is
    signal s_q : std_logic_vector(7 downto 0);
begin
p_latch : process (d, en)
begin
if (en = '1') then
s_q <= d;
else
s_q <= s_q;
end if;
end process p_latch;
q <= s_q; 
end architecture Behavioral;
```
### Listing of VHDL reset and stimulus process from the testbench:
```
p_reset_gen : process
begin
s_reset <= '0';
wait for 45 ns;
s_reset <= '1';
wait for 5 ns;
s_reset <= '0';
wait for 5 ns;
end process p_reset_gen;
 
p_stimulus : process
begin
report "Stimulus process started" severity note;
s_d <= "0000";

wait for 30 ns;
s_d