module sw2led2(
input wire [7:0] sw,
output wire [7:0] ld
) ;
wire [7:0] ldr;
wire [7:0] alu_rst;
wire [7:0] alu_a;
wire [7:0] alu_b;
wire [7:0] alu_r;
wire [7:0] r_out;
wire [7:0] r_out_r;
wire [7:0] r_out_r_r;
wire [7:0] r_out_r_r_r;
wire [7:0] r_out_r_r_r_r;
assign alu_rst = ldr[5];
assign alu_a = alu_rst? ~ldr[4] : ldr[4];
assign alu_b = alu_rst? ~ldr[1] : ldr[1];
assign alu_r = (alu_rst == 1)? { r_out, r_out_r, r_out_r_r, r_out_r_r_r }
: { ~r_out, ~r_out_r, ~r_out_r_r, ~r_out_r_r_r };
assign r_out = alu_rst? { alu_a, alu_b } : { alu_a, alu_b, alu_rst };
assign r_out_r = r_out ^ alu_rst ;
assign r_out_r_r = r_out_r ^ alu_rst ;
assign r_out_r_r_r = r_out_r_r ^ alu_rst ;
assign r_out_r_r_r_r = r_out_r_r_r ^ alu_rst ;
assign ld = alu_a & alu_r;
endmodule
### Testbench Code:
module testbench (
input wire clk,
input wire reset,
input wire [7:0] sw,
output wire [7:0] ld,
output reg [7:0] led_out
) ;
sw2led2 inst_sw2led2 (.sw (sw),.ld (ld));
always @ (posedge clk or posedge reset) begin
if (reset) begin
ld <= 8'b0;
led_out <= 8'b0;
end
else begin
ld <= 8'b11111111;
ld <= 8'b00001111;
ld <= 8'b00010000;
ld <= 8'b00100000;
ld <= 8'b01000000;
ld <= 8'b10000000;
ld <= 8'b11111111;
end
end
endmodule

## Verilog Code

module sw2led2(
input wire [7:0] sw,
output wire [7:0] ld
) ;
wire [7:0] ldr;
wire [7:0] alu_rst;
wire [7:0] alu_a;
wire [7:0] alu_b;
wire [7:0] alu_r;
wire [7:0] r_out;
wire [7:0] r_out_r;
wire [7:0] r_out_r_r;
wire [7:0] r_out_r_r_r;
wire [7:0] r_out_r_r_r_r;
assign alu_rst = ldr[5];
assign alu_a = alu_rst? ~ldr[4] : ldr[4];
assign alu_b = alu_rst? ~ldr[1] : ldr[1];
assign alu_r = (alu_rst == 1)? { r_out, r_out_r, r_out_r_r, r_out_r_r_r }
: { ~r_out, ~r_out_r, ~r_out_r_r, ~r_out_r_r_r };
assign r_out = alu_rst? { alu_a, alu_b } : { alu_a, alu_b, alu_rst };
assign r_out_r = r_out ^ alu_rst ;
assign r_out_r_r = r_out_r ^ alu_rst ;
assign r_out_r_r_r = r_out_r_r ^ alu_rst ;
assign r_out_r_r_r_r = r_out_r_r_r ^ alu_rst ;
assign ld = alu_a & alu_r;
endmodule


## Testbench Code

module testbench (
input wire clk,
input wire reset,
input wire [7:0] sw,
output wire [7:0] ld,
output reg [7:0] led_out
) ;
sw2led2 inst_sw2led2 (.sw (sw),.ld (ld));
always @ (posedge clk or posedge reset) begin
if (reset) begin
ld <= 8'b0;
led_out <= 8'b0;
end
else begin
ld <= 8'b11111111;
ld <= 8'b00001111;
ld <= 8'b00010000;
ld <= 8'b00100000;
ld <= 8'b01000000;
ld <= 8'b10000000;
ld <= 8'b11111111;
end
end
endmodule


## Results

### Circuit

Figure 5. Circuit Diagram

### Waveforms

Figure 6. Waveforms

## Conclusion

In this tutorial, we were able to show how we can implement an ALU unit.

In a real-world implementation, we have to take into account many different factors when designing the ALU unit including instruction set, data organization, instruction/data paths, logic gates, registers, and latches/flip-flops.

This tutorial was inspired by an article that can be found at:

https://medium.com/@gokulrams/what-is-an-alu-6332f3d306d9

## References

[1],. Computer Architecture: A Quantitative Approach - Addison-Wesley Longman Publishing Group, 6th Edition.

[2],. Computer Architecture: A Quantitative Approach - Addison-Wesley Longman Publishing Group, 6th Edition.

[3] https://en.wikipedia.org/wiki/Arithmetic-logic_unit

[4] https://en.wikipedia.org/wiki/Control_unit

[5] https://en.wikipedia.org/wiki/Control_unit

[6] https://en.wikipedia.org/wiki/Control_unit

[7] https://www.edn.com/article/441641/A-Newbie-Gets-It-Right-The-ALU-Unit-Part-A/

[8] https://www.edn.com/article/441641/A-Newbie-Gets-It-Right-The-ALU-Unit-Part-A/

[9] https://www.edn.com/article/441641/A-Newbie-Gets-It-Right-The-ALU-Unit-Part-A/

[10] https://www.edn.com/article/441641/A-Newbie-Gets-It-Right-The-ALU-Unit-Part-A/

[11] https://www.edn.com/article/441641/A-Newbie-Gets-It-Right-The-ALU-Unit-Part-A/

[12] https://www.edn.com/article/441641/A-Newbie-Gets-It-Right-The-ALU-Unit-Part-A/

[13] https://www.edn.com/article/441641/A-Newbie-Gets-It-Right-The-ALU-Unit-Part-A/

[14] https://www.edn.com/article/441641/A-Newbie-Gets-It-Right-The-