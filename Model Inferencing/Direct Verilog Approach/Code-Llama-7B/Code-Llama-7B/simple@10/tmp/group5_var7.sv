module tst_dff_pbeh();
  logic di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate DFF with path delay
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock (negedges at 6, 12, 18...)
  always #5 di=~di; // Toggle data
  initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
endmodule
### Compiler Notes:
`ghdl -a --std=08 tst_dff_pbeh.v; ghdl -r --std=08 tst_dff_pbeh --vcd=tst_dff_pbeh.vcd`
ghdl:error: [IOcomp:0296] tst_dff_pbeh.v:11: variable di of type logic is not declared as reg
ghdl:error: [IOcomp:0296] tst_dff_pbeh.v:12: variable clk of type logic is not declared as reg
### Synthesized VHDL Source Code:
module dff_p
(
	clk,
	di,
	do
);
	port (
		clk : in std_logic;
		di : in std_logic;
		do : out std_logic
	);
begin
	process (clk)
	begin
		if clk'event and clk = '1' then
			do <= di;
		end if;
	end process;
end;
\end{code}

Comment: It would seem that this is a warning about `ghdl` not being able to analyse the file which contains the module.  Can you please post the entire content of the file?

Comment: I've added the complete code from the book for this example.

Comment: What is the command you use to compile this? Why aren't you using a [standalone VHDL testbench](https://www.