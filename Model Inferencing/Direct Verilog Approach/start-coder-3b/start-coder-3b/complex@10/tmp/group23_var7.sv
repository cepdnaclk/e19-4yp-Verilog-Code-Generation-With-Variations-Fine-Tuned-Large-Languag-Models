module shift_reg( input [3:0] d_in, input clk, sr, sl, ld,
input [1:0] s_cnt, output reg [3:0] q);
reg [3:0] int_q;
wire [3:0] constant_array[3:0] = {4'h7, 4'hF, 4'h3,4'h0};

always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
if( ld )
int_q = d_in;
else if( sr )
int_q = q >> s_cnt;
else if( sl )
int_q = q << s_cnt;
else int_q = q;
end
always @( posedge clk ) begin: register
if (rst) q <= 0;
else if (rr.ir == 0)
q <= int_q;
else if (rr.ir == 1)
begin
q <= constant_array;
end
else if (rr.ir == 2)
begin
q <= constant_array;
end
end
endmodule


My questions are:

What makes a MUX different from a register?

Is it the way the internal registers work that makes a MUX different from a register?

• 1. I think you may be confusing MUX with multiplexer (MUX is a special case of multiplexer). – ajs1979 Mar 15 at 20:44
• @ajs1979 So is the answer to the above question no? –  Mar 16 at 1:58

A MUX is a digital circuit that selects one of several inputs and outputs that input. The output is the same type as the input. A register, on the other hand, is a circuit that always takes on a single input and produces a single output.

So, the circuit is one of the inputs to the other. The circuit is not a register, by itself.

• I think the OP is asking if it's the way the internal registers work that makes a MUX different from a register, not if a MUX is a special case of a register. – ajs1979 Mar 15 at 20:41
• @ajs1979 I would say that the combination of the internal registers work differently makes a MUX different from a register. –  Mar 15 at 20:50
• @ajs1979 I wouldn't say the combination of them doesn't make them different, but that they are different in that one uses internal registers, while the other uses external registers. –  Mar 16 at 15:22
• @DaveTweed that's a good way to put it. – ajs1979 Mar 16 at 15:29

It looks like you've taken the base code and added a single multiplexer to it.

A multiplexer is a way of combining multiple inputs into a single output.

In this case, you have the inputs "d_in", "s_cnt", "sr", "sl", and "ld." The output of this multiplexer is what gets fed into the register.

To add a multiplexer, you need:

Input A
Input B
Select
Output

You can use the select line to select between the two input lines.

Your select line is what you've called the "constant_array."

Note that this is an unsigned 4-bit value. In Verilog, you'd select between two 4-bit values by using an unsigned right-shift (e.g. the value $$\\leftarrow 4'hF >> 2\$$).

• This is the right way to say what I want. I want to use a multiplexer instead of a register, because the register is slow. –  Mar 15 at 20:53
• @DaveTweed If "slow" is your only concern, you could just make the combination of registers more complex, rather than trying to replace every register with a multiplexer – ajs1979 Mar 15 at 20:57
• @DaveTweed I'm not sure that's what you want. From my perspective, I wouldn't want to replace a standard register with a multiplexer. – ajs1979 Mar 15 at 20:58
• I see. My concern is the slow register. If I can use a multiplexer instead, then I want it. – Dave Tweed Mar 15 at 21:00
• @DaveTweed What makes a register slow? – ajs1979 Mar 15 at 21:01