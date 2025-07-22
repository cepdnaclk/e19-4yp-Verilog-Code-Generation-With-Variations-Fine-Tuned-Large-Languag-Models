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
        inside(0,3): Adjr = 2'b11;
        default: Adjr = 2'b00;
    endcase
    HiCount = 2'b0;
end
endmodule

```
Upvotes: 0 username_2: The problem is that you are trying to implement the functionality of the `case` statement using the `always` block. For the PLL, you have to use an edge-sensitive block. So I changed your code to

```
`timescale 1 ns / 1 ps

module JerkyComparator (output[1:0] AdjustFreq, input ClockIn, PLLClock, Reset);
reg[1:0] Adjr;
assign AdjustFreq = Adjr;
reg[1:0] HiCount;

always @(PLLClock or Reset)
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
        default: Adjr = 2'b00;
    endcase
    HiCount = 2'b0;
end
endmodule

```

The output of the PLL is available in `AdjustFreq`, so this is the one that must be controlled by the `PLL`, and not any other signal. I added an edge-sensitive `always` block.

Then, to reduce the combinatorial logic of the `always`, I moved the `HiCount` register, and the cases inside an `always_comb` block.

```
`timescale 1 ns / 1 ps

module JerkyComparator (output[1:0] AdjustFreq, input ClockIn, PLLClock, Reset);
reg [1:0] Adjr;
assign AdjustFreq = Adjr;

always_comb
begin
    case (HiCount)
        2'b00: Adjr = 2'b11;
        2'b01: Adjr = 2'b01;
        default: Adjr = 2'b00;
    endcase
end

always @(PLLClock or Reset)
if (Reset==1'b1)
begin
    HiCount = 2'b0;
end
else if (PLLClock==1'b1)
    HiCount = HiCount + 2'b01;
end
endmodule

```

As a note, you don't need the `inside` macro.
Upvotes: 2 [selected_answer]