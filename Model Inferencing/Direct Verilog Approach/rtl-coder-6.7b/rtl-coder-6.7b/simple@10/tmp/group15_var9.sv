module sw2led2_tb ;
reg [7:0] sw ;
wire [7:0] ld ;
sw2led2 dut (
.sw (sw),
.ld (ld)
) ;
int i ;
initial begin
for (i = 1; i <= 256; i=i+1) begin
sw = i ;
#1ns ;
end
$finish ;
end
endmodule