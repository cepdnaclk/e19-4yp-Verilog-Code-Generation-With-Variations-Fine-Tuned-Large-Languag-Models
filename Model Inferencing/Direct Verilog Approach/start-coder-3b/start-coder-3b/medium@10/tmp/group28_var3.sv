module cnt44(o,i);
output[3:0]o;
input[3:0]i;
reg[4:0] r;
wire [2:0]addr;
assign o = r[3:0];
always @* begin
case (addr)
0:
r = i == 'bx? 0 : i + 1;
1:
r = r[3:1] + (i == 'bx? 0 : i + 1);
2:
r = r[3:2] + (i == 'bx? 0 : i + 1);
3:
r = r[3:3] + (i == 'bx? 0 : i + 1);
4:
r = r[3:4] + (i == 'bx? 0 : i + 1);
end
endmodule

The next variation instruction is to generate an arbitrary 4:16 UpCounter, using the same methodology by changing the number of bits (16) for each variation.

## Example 7

Create a 4:16 UpCounter.

### Base Verilog Code:
module cnt1616(o,i);
output[15:0]o;
input[15:0]i;
assign o = i == 'bx? 0 : i + 1;
endmodule

### Variation Instruction:
Add a 16-bit wide register