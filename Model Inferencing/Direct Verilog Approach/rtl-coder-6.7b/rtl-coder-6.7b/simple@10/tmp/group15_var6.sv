module tb_sw2led2 ();

// SWITCH 2 LED Converter Inputs
logic [7:0] sw ;

// SWITCH 2 LED Converter Outputs
wire [7:0] ld;

// SWITCH 2 LED Converter Module Under Test
sw2led2 t1(
.sw(sw),
.ld(ld) );

// Initialize the switch (sw)
initial
begin 
sw=8'b0; #20ns;
$display("sw = 00000000");

sw=8'b01010101; #20ns;
$display("sw = 01010101");

sw=8'b11111111; #20ns;
$display("sw = 11111111");

sw=8'b10000000; #20ns;
$display("sw = 10000000");

sw=8'b10000001; #20ns;
$display("sw = 10000001");

sw=8'b11000000; #20ns;
$display("sw = 11000000");

end
endmodule
### Modified Results:
sw =  8'b00000000
sw =  8'b01010101
sw =  8'b11111111
sw =  8'b10000000
sw =  8'b10000001
sw =  8'b11000000