module counter (output[5:0] up_counter, output[3:0] down_counter, input[1:0] count_select, input count_in, input count_out, input clock, input reset);
reg[3:0] up_counter_reg;
reg[5:0] up_counter_reg_new;
reg[5:0] down_counter_reg;
reg[5:0] down_counter_reg_new;
initial
up_counter_reg = 4'b0000;
up_counter_reg_new = 4'b0000;
down_counter_reg = 4'b0000;
down_counter_reg_new = 4'b0000;
always @(posedge clock)
if (reset == 1'b1)
    down_counter_reg <= 4'b0000;
end
always @(posedge clock)
if (reset == 1'b1)
    up_counter_reg <= 4'b0000;
end
always @(posedge clock)
if (count_in == 1'b1)
if (count_select == 2'b00)
    up_counter_reg_new = up_counter_reg + 1;
else
    up_counter_reg_new = down_counter_reg - 1;
end
else
    up_counter_reg_new = up_counter_reg;
end
always @(posedge clock)
if (count_out == 1'b1)
if (count_select == 2'b00)
    up_counter_reg = up_counter_reg_new;
else
    down_counter_reg = down_counter_reg_new;
end
end
assign up_counter = up_counter_reg;
assign down_counter = down_counter_reg;
endmodule
### Comments:
No changes were made to the code.
### Time and Frequency:
Timing and frequency of implementation of this code:
* Time: 200 ns
* Frequency: 50 MHz
/Verilog/Assignment 5/README.md
* **Design Name:** Incrementing counter (2-bit, 4-bit, 5-bit, 8-bit, 10-bit, 16-bit)
* **Description:** Increment the counter using a clock, enable signal, and reset signal. The counter should be 8-bit when the size is specified as 8 bits.
### Base Verilog Code:
module counter(output[7:0] counter, input [1:0] size, input count_in, input count_out, input clock, input reset);
reg[7:0] counter_reg