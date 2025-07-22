module JerkyComparator (output[1:0] AdjustFreq, input ClockIn, PLLClock, Reset);
reg[1:0] Adjr;
assign AdjustFreq = Adjr;
reg[1:0] HiCount;
reg[1:0] HiCount_a;
always @(ClockIn, Reset)
    if (Reset==1'b1)
    begin
        Adjr = 2'b01;
        HiCount = 2'b0;
        HiCount_a = 2'b0;
    end
    else if (PLLClock==1'b1)
        HiCount = HiCount + 2'b01;
        HiCount_a = HiCount_a + 2'b01;
    else begin
        case (HiCount)
            2'b00: Adjr = 2'b11;
            2'b01: Adjr = 2'b01;
            default: Adjr = 2'b00;
        endcase
        HiCount = 2'b0;
        HiCount_a = 2'b0;
    end
else begin
    case (HiCount_a)
        2'b00: Adjr = 2'b11;
        2'b01: Adjr = 2'b01;
        default: Adjr = 2'b00;
    endcase
    HiCount = 2'b0;
    HiCount_a = 2'b0;
end
endmodule

```

### Example

```
module JerkyComparator (output[1:0] AdjustFreq, input ClockIn, PLLClock, Reset);
reg[1:0] Adjr;
assign AdjustFreq = Adjr;
reg[1:0] HiCount;
reg[1:0] HiCount_a;
reg[1:0] HiCount_b;
always @(ClockIn, Reset)
    if (Reset==1'b1)
    begin
        Adjr = 2'b01;
        HiCount = 2'b0;
        HiCount_a = 2'b0;
        HiCount_b = 2'b0;
    end
    else if (PLLClock==1'b1)
        HiCount = HiCount + 2'b01;
        HiCount_a = HiCount_a + 2'b01;
        HiCount_b = HiCount_b + 2'b00;
    else begin
        case (HiCount)
            2'b00: Adjr = 2'b11;
            2'b01: Adjr = 2'b01;
            default: Adjr = 2'b00;
        endcase
        HiCount = 2'b0;
        HiCount_a = 2'b0;
        HiCount_b = 2'b0;
    end
else begin
    case (HiCount_a)
        2'b00: Adjr = 2'b11;
        2'b01: Adjr = 2'b01;
        default: Adjr = 2'b00;
    endcase
    HiCount = 2'b0;
    HiCount_a = 2'b0;
    HiCount_b = 2'b0;
end
endmodule

module JerkyComparator_tb;

reg ClockIn;
reg PLLClock;
reg Reset;
wire[1:0] AdjustFreq;

JerkyComparator IC (AdjustFreq, ClockIn, PLLClock, Reset);

initial
begin
    ClockIn = 1'b0;
    PLLClock = 1'b0;
    Reset = 1'b0;
    #1;
    ClockIn = 1'b1;
    #5;
    Reset = 1'b1;
    #5;
    ClockIn = 1'b0;
    #5;
    Reset = 1'b0;
    #5;
    ClockIn = 1'b1;
    #5;
    Reset = 1'b1;
    #5;
    ClockIn = 1'b0;
    #5;
    Reset = 1'b0;
    #5;
    ClockIn = 1'b1;
    #5;
    Reset = 1'b1;
    #5;
    ClockIn = 1'b0;
    #5;
    Reset = 1'b0;
    #5;
    ClockIn = 1'b1;
    #5;
    Reset = 1'b1;
    #5;
end
endmodule

```username_1: I wouldn't change the code here because it's correct, but rather just change your testbench for the `JerkyComparator` as follows:

```
module JerkyComparator_tb;

    reg ClockIn;
    reg PLLClock;
    reg Reset;
    wire[1:0] AdjustFreq;

    JerkyComparator IC (AdjustFreq, ClockIn, PLLClock, Reset);

    initial
        begin
            ClockIn = 1;
            PLLClock = 1;
            Reset = 1;
            #10;
            ClockIn = 0;
            #1;
            ClockIn = 1;
            #100;
            Reset = 0;
            #100;
            ClockIn = 0;
            #1;
            ClockIn = 1;
            #100;
            Reset = 1;
            #100;
            ClockIn = 0;
            #1;
            ClockIn = 1;
            #100;
            Reset = 0;
            #100;
            ClockIn = 0;
            #1;
            ClockIn = 1;
            #100;
            Reset = 1;
            #100;
            ClockIn = 0;
            #1;
            ClockIn = 1;
            #100;
            Reset = 0;
            #100;
            ClockIn = 0;
            #1;
            ClockIn = 1;
            #100;
            Reset = 1;
            #100;
            ClockIn = 0;
            #1;
            ClockIn = 1;
            #100;
        end
endmodule

```

Running this testbench on your original code yields the expected results:

[![enter image description here](https://i.stack.imgur.com/N3L4W.png)](https://i.stack.imgur.com/N3L4W.png)
Upvotes: 3 [selected_answer]username_2: I believe the problem here is that your testbench is not resetting the registers between tests. When I modify your code to include a reset signal as the other answer shows, the output is correct.

I am not sure if this would be the solution to the problem, but I believe that using a **tristate buffer** to pull the Reset signal down to the comparator is a good idea. This way you can control when it is pulled low without using a second (potentially not as fast) clock.

The modified code is as follows:

```
module JerkyComparator (output[1:0] AdjustFreq, input ClockIn, PLLClock, Reset);
    // Tristate buffer that pulls Reset signal down to IC
    wire ResetPullup = Reset ^ 1'b0;
    // Output signal to IC
    reg[1:0] Adjr;
    assign AdjustFreq = Adjr;
    // Comparator
    reg[1:0] HiCount;
    reg[1:0] HiCount_a;
    reg[1:0] HiCount_b;
    always @(ClockIn, ResetPullup)
        if (ResetPullup==1'b1)
        begin
            Adjr = 2'b01;
            HiCount = 2'b0;
            HiCount_a = 2'b0;
            HiCount_b = 2'b0;
        end
        else if (PLLClock==1'b1)
            HiCount = HiCount + 2'b01;
            HiCount_a = HiCount_a + 2'b01;
            HiCount_b = HiCount_b + 2'b00;
        else begin
            case (HiCount)
                2'b00: Adjr = 2'b11;
                2'b01: Adjr = 2'b01;
                default: Adjr = 2'b00;
            endcase
            HiCount = 2'b0;
            HiCount_a = 2'b0;
            HiCount_b = 2'b0;
        end
    else begin
        case (HiCount_a)
            2'b00: Adjr = 2'b11;
            2'b01: Adjr = 2'b01;
            default: Adjr = 2'b00;
        endcase
        HiCount = 2'b0;
        HiCount_a = 2'b0;
        HiCount_b = 2'b0;
    end
endmodule

module JerkyComparator_tb;