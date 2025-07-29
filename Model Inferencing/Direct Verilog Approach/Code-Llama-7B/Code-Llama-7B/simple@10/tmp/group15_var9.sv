module tb_sw2led2 (
input wire clk,
input wire rst,
input wire [7:0] sw,
output wire [7:0] ld
) ;
reg [7:0] sw_r;
reg [7:0] ld_r;
wire [7:0] led_r;
reg [7:0] led_r_int;
reg [7:0] sw_r_int;
reg [7:0] ld_r_int;

// sw_r: wire to register
always@* begin
sw_r = sw;
end
// ld_r: wire to register
always@* begin
ld_r = ld;
end
// led_r: reg to output
always@(posedge clk or posedge rst) begin
if (rst) begin
led_r_int = 8'd0;
end
else begin
led_r_int = led_r;
end
end
// sw_r_int: reg to input
always@(posedge clk or posedge rst) begin
if (rst) begin
sw_r_int = 8'd0;
end
else begin
sw_r_int = sw_r;
end
end
// ld_r_int: reg to input
always@(posedge clk or posedge rst) begin
if (rst) begin
ld_r_int = 8'd0;
end
else begin
ld_r_int = ld_r;
end
end
// Instantiate the DUT
sw2led2 dut (
.sw(sw_r_int),
.ld(ld_r_int)
);
// Outputs
assign led_r = ld_r_int;
endmodule