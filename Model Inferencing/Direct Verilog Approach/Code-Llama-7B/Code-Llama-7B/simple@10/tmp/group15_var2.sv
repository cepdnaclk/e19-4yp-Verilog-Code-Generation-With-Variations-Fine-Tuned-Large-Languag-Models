module sw2led2 (
input wire [7:0] sw,
output wire [7:0] ld
) ;
assign ld = $unsigned(sw);
endmodule
### Test Code:
module alu_tb;
reg [7: