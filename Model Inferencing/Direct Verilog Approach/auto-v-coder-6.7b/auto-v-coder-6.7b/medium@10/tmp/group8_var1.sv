```verilog
module dec2_4beh(output reg[3:0] o, input reg[1:0] i);
always @(*)
begin
if(i == 2'b00)
    o = 4'b0001;
else if(i == 2'b01)
    o = 4'b0010;
else if(i == 2'b10)
    o = 4'b0100;
else if(i == 2'b11)
    o = 4'b1000;
else
    o = 4'b0000;
end
endmodule
```

The above module is a 2 to 4 bit decoder that translates binary input to binary output. It's always ready as there's no clock involved.

In the simulation code, we're setting the input to binary 2'b00 for the output to become 4'b0001. The rest of the input-output mapping is done in a similar manner. The else case (i.e., when the input is not in the specified cases) leads to the output being 0.

Please note that the always_comb keyword is not necessary as there's no combinational logic in the module. The always_@* performs combinational logic as the sensitivity list is (*) which means monitor all the inputs and outputs of the module.

Also, this code does not use the sensitivity list and therefore uses an always_comb block to generate the output. However, using always_comb also results in combinational logic being performed, so it's not used here. Instead, always_@* is used.

Please also note that this module can be written as a Mux (Multiplexer) with 4 inputs and one output. The output is determined by the input value. The inputs are directly assigned to the output in the module. 

If you need the outputs to be delayed with respect to the inputs, you can replace "always_@*" with "always" and add a delay in the sensitivity list. However, this will result in a sequential logic and thus it is not necessary in this case.

This is a simplified version of Verilog and may not be the most efficient way to code the decoder, but