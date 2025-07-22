```
module TestBench(
    input wire ClockIn,
    input wire Reset,
    output wire PLLClock,
    output wire [1:0] AdjustFreq
    );
reg [1:0] Adjr;
reg PLLCount;

PLLClock = 1'b0;

always @(posedge ClockIn)
begin
	PLLCount = PLLCount + 1'd1;
	if (PLLCount == 3'd12)
	begin
		PLLCount = 0;
		PLLClock = 1'b1;
		Adjr = Adjr + 2'd1;
		AdjustFreq = Adjr;
		case (Adjr)
        2'b00: Adjr = 2'b10;
        2'b10: Adjr = 2'b0