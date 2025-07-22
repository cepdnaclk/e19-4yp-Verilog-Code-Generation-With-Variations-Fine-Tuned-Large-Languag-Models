module encoder (BCD_in, Excess_3_out);
input [3:0] BCD_in;
output [3:0] Excess_3_out;
assign Excess_3_out = BCD_in + 3;
endmodule

module t_encoder();
reg [3:0] BCD_in;
wire [3:0] Excess_3_out;
encoder M0(BCD_in, Excess_3_out);
initial
$monitor($time,,"BCD = %b, Excess-3 Code = %b", BCD_in, Excess_3_out);

initial begin
end
initial begin //Simulation Test Pattern
end
endmodule

## Exercise 13:
The last exercise takes the 6-bit 2’s complement code and returns either a 3-bit binary code or a 4-bit binary code.
### Base Verilog Code:
module encoder (BCD_in, Excess_3_out);
input [3:0] BCD_in;
output [3:0] Excess_3_out;
assign Excess_3_out = BCD_in + 3;
endmodule

module t_encoder();
reg [3:0] BCD_in;
wire [3:0] Excess_3_out;
encoder M0(BCD_in, Excess_3_out);
initial
$monitor($time,,"BCD = %b, Excess-3 Code = %b", BCD_in, Excess_3_out);

initial begin
end
initial begin //Simulation Test Pattern
end
endmodule
### Variation Instruction