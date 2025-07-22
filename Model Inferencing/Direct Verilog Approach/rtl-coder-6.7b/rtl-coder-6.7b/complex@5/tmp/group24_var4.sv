```
module mup_opr(input clk,int,en, // Clock, interrupt, enable inputs
output reg [3:0] dcop, // Display code output, 4-bit opcode
output reg [15:0] pc, ir); // Program counter, instruction register
// Module contents...
`ifdef XMR
reg [11:0]consts[8]='{10'hFE1,-10'hFEA,10'hFDB,10'hFD2,-10'hFE3,10'hFF4,10'hFFD,10'hFF6}; // Constants
reg [31:0] BCD_in=1'b0,BCD_out=1'b0; // BCD input, output using BCD adder
`endif
reg [15:0] opcode=16'h0000; // Opcode
always @(posedge clk)
begin
if(en) // Enable circuitry
begin
opcode=ir;
end
end
always @(op)
begin
if (op==8'hFF) // Opcode FF (RST)
begin
// Reset instructions
opcode=16'h0000;
end
else if(op==8'hFA) // Opcode FA (RET)
begin
// Return from subroutine
pc<=opcode[15:0];
end
else if(op[7:4]==4'h1 || op[7:4]==4'h2) // Opcode 1x or 2x (LDX)
begin
if(op[7:4]==4'h1) // Load value from memory into XMR
begin
xmr<=mem[opcode[ADDR_WIDTH-1:0]];
end
else begin // Load value from XMR into memory
mem[opcode[ADDR_WIDTH-1:0]]<=xmr;
end
end
else if(op[7:4]==4'h3 || op[7:4]==4'h4)
begin
if(op[7:4]==4'h3) // Add to XMR
begin
xmr<=xmr+opcode[3:0];
end
else // Subtract from XMR
begin
xmr<=xmr-opcode[3:0];
end
end
else if(op[7:4]==4'h5 || op[7:4]==4'h6)
begin
if(op[7:4]==4'h5) // Compare using XMR
begin
cmp_res<=xmr==opcode[3:0];
end
else begin // Add using XMR
xmr<=xmr+opcode[3:0];
```
### Modification 1
XMR is stored in `mup.cpp`
### Modification 2
Test case is written in `mup_test.cpp`
### Modification 3
```
#define XMR
```
is defined using `-D` option of `g++`