module JerkyComparator (output[1:0] AdjustFreq, input ClockIn, PLLClock, Reset);
reg[1:0] Adjr;
assign AdjustFreq = Adjr;
reg[1:0] HiCount;
always @(ClockIn, Reset)
if (Reset==1'b1)
begin
    Adjr = 2'b01;
    HiCount = 2'b0;
end
else if (PLLClock==1'b1)
    HiCount = HiCount + 2'b01;
else begin
    case (HiCount)
        2'b00: Adjr = 2'b11;
        2'b01: Adjr = 2'b01;
        default: if (inside (HiCount, {2'b0, 2'b10});
            Adjr = 2'b00;
        end
    endcase
    HiCount = 2'b0;
end
endmodule
### Variation Description:
In this variation, the `inside` construct is used to check if `HiCount` is in the array `{2'b0, 2'b10}`. If it is, then the `Adjr` register is set to `2'b00`. The `inside` construct is a useful construct when checking for membership of a value in a range or array of values.