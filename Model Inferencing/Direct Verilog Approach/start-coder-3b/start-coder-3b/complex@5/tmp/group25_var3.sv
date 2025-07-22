module divider (clk_i, rst_i, div_out, div_enable);
input clk_i, rst_i;
output div_out;
output reg div_enable;
reg [1:0] cnt_reg;
wire [1:0] cnt_sel;
always @(posedge clk_i)
begin
if (rst_i)
begin
cnt_reg <= 2'b00;
cnt_sel <= 2'b00;
div_enable <= 0;
end
else
begin
cnt_reg <= cnt_reg + 2'b01;
cnt_sel <= cnt_sel + 2'b01;
if (cnt_reg == 2'b11 && cnt_sel == 2'b10)
begin
div_enable <= 1;
cnt_reg <= 2'b00;
cnt_sel <= 2'b00;
end
end
end
always @(div_enable or rst_i) // or rst_i
begin
div_out = (div_enable == 1);
end
endmodule

# [Project 6](#)
## Implement a VGA generator.
### Base Verilog Code:
module vga (clk_i, rst_i, red, green, blue);
param DWIDTH = 8, DHEIGHT = 640, HREF_PERIOD = 42, HREF_PULSE_WIDTH = 21, HREF_PULSE_START = 65, HREF_PULSE_END = 370, HREF_PULSE_OFFSET = 63, HREF_PULSE_MIN = 0, HREF_PULSE_MAX = 255;
input clk_i, rst_i;
output [DWIDTH-1:0] red;
output [DWIDTH-1:0] green;
output [DWIDTH-1:0] blue;
reg [DWIDTH-1:0] red_reg;
reg [DWIDTH-1:0] green_reg;
reg [DWIDTH-1:0] blue_reg;
wire [DHEIGHT-1:0] red_sel;
wire [DHEIGHT-1:0] green_sel;
wire [DHEIGHT-1:0] blue_sel;
wire [DHEIGHT-1:0] HREF_reg;
assign HREF_reg = (HREF_PULSE_OFFSET <= (HREF_PULSE_START + (HREF