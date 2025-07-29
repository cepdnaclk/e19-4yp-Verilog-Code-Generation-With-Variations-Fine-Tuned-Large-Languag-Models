module ALU_tb ();
reg [7:0] SRC1=10;
reg [7:0] SRC2=2;
reg [3:0] sel;
reg [7:0] SRC1_signed;
reg [7:0] SRC2_signed;
wire [7:0] Output;
wire Carry;
wire Zero;
wire Overflow; //overflow flag
wire Unsigned;
wire [7:0] Output_signed;
sw2led2 ALU_0 (
.SRC1(SRC1),
.SRC2(SRC2),
.ld(Output)
);
sw2led2 ALU_1 (
.SRC1(SRC1),
.SRC2(SRC2),
.ld(Output_signed)
);
assign SRC1_signed=10;
assign SRC2_signed=2;
alu ALU_1 (
.SRC1(SRC1),
.SRC2(SRC2),
.sel(sel),
.Output(Output),
.Carry(Carry),
.Zero(Zero),
.Overflow(Overflow),
.Unsigned(Unsigned)
);
ALU_0 ALU_2 (
.SRC1(SRC1_signed),
.SRC2(SRC2_signed),
.ld(Output_signed)
);
always #5
sel=sel+1'b1;
endmodule
### Simulation:
```
vsim ALU_tb
do wave.do
run
#50
sel=4'b1001 
#50
sel=4'b1010
#50
sel=4'b1011
#50
sel=4'b1100
#50
sel=4'b1101
#50
sel=4'b1110
#50
sel=4'b1111 
#50
sel=4'b0000
#50
sel=4'b0001
#50
sel=4'b0010
#50
sel=4'b