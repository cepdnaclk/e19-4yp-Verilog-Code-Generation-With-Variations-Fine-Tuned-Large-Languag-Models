entity dff_with_reset is
port (data, clock, r, out: in bit;
out: out bit);
end entity;

architecture RTL of dff_with_reset is
signal out: bit;
begin
process (data, clock, r)
begin
if r then
out <= '0';
else
out <= data;
end if;
end process;
end architecture;

## Verilog-AMS Code

module dff_with_reset #(parameter RST_VAL = 0)
(input clk, rst, input data, output reg out);
always @ (posedge clk or negedge rst)
begin
if (rst)
out = RST_VAL;
else
out = data;
end
endmodule
### Variation Instruction:
Use the SSI function, provided in the SystemVerilog standard library,