module sw2led2 (
input wire [7:0] sw,
output wire [7:0] ld
) ;
assign ld = sw;
endmodule
### Test Bench:
module sw2led2_testbench();
reg [7:0] sw;
wire [7:0] ld;
sw2led2 dut2(.sw,.ld);
initial begin
sw = 8’b00000000; # 100;
sw = 8’b00000001; # 100;
sw = 8’b00011011; # 100;
sw = 8’b00101010; # 100;
sw = 8’b00110000; # 100;
sw = 8’b00110101; # 100;
sw = 8’b00111111; # 100;
sw = 8’b10000001; # 100;
sw = 8’b11111111; # 100;
end
initial begin
$monitor(“Time=%d, SW=%b, LD=%b”, $time, sw,ld);
end
endmodule