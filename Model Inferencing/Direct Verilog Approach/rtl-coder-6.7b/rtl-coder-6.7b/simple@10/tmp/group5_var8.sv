module tst_dff_pbeh();
  logic di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate DFF with path delay
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock (negedges at 6, 12, 18...)
  always #5 di=~di; // Toggle data
  initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
endmodule

### VHDL Code:
-- dff_p.vhd (Delayed D flip flop)
entity dff_p is
  port(do,di,clk: in bit;
       q: out bit);
end dff_p;
architecture behav of dff_p is
begin
  process(clk)
  begin
    if rising_edge(clk)
      q <= di after 2;
    end if;
  end process;
end behav;

-- tst_dff_p.vhd (Testbench harness)
entity tst_dff_p is
end tst_dff_p;
architecture behav of tst_dff_p is
  component dff_p is
    port(do,di,clk: in bit;
         q: out bit);
  end component;
  signal di,clk: bit;
  signal q: bit;
begin
  -- Instantiate DFF with path delay
  u1: dff_p port map (q,di,clk);
  -- Initialize & stop
  process
  begin
    clk<='0'; di<='0';
    wait for 35 ns;
    wait;
  end process;
  -- Generate clock (negedges at 6, 12, 18...)
  process
  begin
    wait for 6 ns; clk<=not clk;
  end process;
  -- Toggle data
  process
  begin