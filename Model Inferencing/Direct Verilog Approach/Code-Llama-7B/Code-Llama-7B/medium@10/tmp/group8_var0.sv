module tst_dec2_4beh();
wire [3:0]o;
reg[1:0] i;
//reg en; // Enable not used in dec2_4beh
dec2_4beh dec(o,i);
initial
begin
i =2'b00;
end
initial $monitor ($time, " output o = %b, input i = %b ", o,i);
initial #14 $stop; // Stop simulation
endmodule
### Modified Variation:
This code is written in the testbench module tst_dec2_4beh.v as:
`ifdef VAR
always @(i)
begin
    if(i == 2'b10 || i == 2'b11)
        o = 4'b0001;
    else
        o[i] = 1;
end
`endif
### Simulation Log:

```verilog