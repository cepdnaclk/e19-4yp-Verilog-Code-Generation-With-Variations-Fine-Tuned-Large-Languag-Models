```
module encoder (BCD_in, Excess_3_out);
input [3:0] BCD_in;
output [3:0] Excess_3_out;
wire [3:0] Adjr;
generate
// Array 1D declaration
logic [15:0] AdjArray = '{1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1};
assign Adjr = AdjArray[BCD_in];
endgenerate
assign Excess_3_out = BCD_in + Adjr;
endmodule

module t_encoder();
reg [3:0] BCD_in;
wire [3:0] Excess_3_out;
encoder M0(BCD_in, Excess_3_out);
initial
$monitor($time,,"BCD = %b, Excess-3 Code = %b", BCD_in, Excess_3_out);

integer i;
initial begin
  for (i=0; i<16; i=i+1) begin
    BCD_in = i;
    #5;
  end
end
endmodule
```
In the `initial` block, we are using a loop to test all possible inputs for BCD_in. During each iteration, we increment BCD_in by 1 and simulate for 5 time units.
Please note that the `AdjArray` declaration is a simple way of initializing the array. The array has an index corresponding to BCD binary values from 0 to 15, and the value is 1 if the BCD value is less than 3, else the value is 0. This means that for any BCD_in value less than 3, the output of the encoder will be BCD_in + 3. If BCD_in value is 3 or more, the output will be BCD_in. ###

Doing so keeps the Excess_3_out the same as BCD_in when BCD_in is less than 3, else, it increases BCD_in by 3. This can be used