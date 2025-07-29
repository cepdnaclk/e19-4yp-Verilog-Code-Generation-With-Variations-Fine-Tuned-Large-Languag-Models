```
module top(input clk, input rst,
           output [7:0] out);

    wire_assign assign(.in(in),.out(out));

    bit clk_divided = 0;
    wire in = clk_divided;

endmodule

module wire_assign(input [7:0] in, output out);
    assign out = in;
endmodule
```
### Simulation Logic
![waveform](