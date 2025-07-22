// Testbench
`timescale 1 ns / 1 ns

module sw2led2_tb;

reg [7:0] sw;
wire [7:0] ld;

sw2led2 dut(.sw(sw),.ld(ld));

initial begin 
#10;
sw = 8'b10101010;
#10;
sw = 8'b00000011;
#10;
sw = 8'b00001100;
#10;
sw = 8'b11100011;
#10;
sw = 8'b11100101;
#10;
sw = 8'b11111111;
#10;
$finish;
end
endmodule
### Answer: