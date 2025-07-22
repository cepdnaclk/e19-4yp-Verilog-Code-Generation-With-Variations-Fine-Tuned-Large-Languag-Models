module tst_ctr_wt;
reg clk,En;
reg[3:0]N;
wire[3:0]a;
generate
for(
begin
clk=0; N=4'b1111; // Set limit to 15
end
endgenerate
ctr_wt c1(a,inside(clk),inside(N),inside(En));
initial
begin
En=1'b0; // Start disabled
end
always
initial #35 $stop; // Stop simulation
initial $monitor($time,"clk=%b, En=%b, N=%d, a=%d",clk,En,N,a); // Corrected format specifiers
endmodule

# VHDL

The first version of the code used a `gen_if` statement; this is supported in VHDL 2008, and is the preferred way to generate code.

## VHDL Code 1

The code is slightly different from the Verilog example, due to the different syntaxes for declaring arrays.

module tst_ctr_wt;
signal clk, En : std_logic;
signal N: std_logic_vector(3 downto 0);
signal a: std_logic_vector(3 downto 0);
component ctr_wt
generic
  (
    limit : integer := 15
  )
port
(
clk,
N,
En,
a
);
end component;

process
begin
clk <= '0';
N <= (others => '1');
En <= '0';
end process;

generation 1;
limit: for i in 0 to 15 generate
process
begin
clk <= '0';
N <= i * 8#1;
En <= '1';
end process;
end for;
generate
end generation;

end tst_ctr_wt;

## VHDL Code 2

This code uses a nested `generate` block with escaped names and apply an inside operator with variable index for range selection.

module tst_ctr_wt;
signal clk, En : std_logic;
signal N: std_logic_vector(3 downto 0);
signal a: std_logic_vector(3 downto 0);
component ctr_wt
generic
  (
    limit : integer := 15
  )
port
(
clk,
N,
En,
a
);
end component;

process
begin
clk <= '0';
N <= (others => '1');
En <= '0';
end process;

generate
begin
generate
process
begin
clk <= '0';
N <= i * 8#1;
En <= '1';
end process;
end generate;
end generate;
end generate;

end tst_ctr_wt;