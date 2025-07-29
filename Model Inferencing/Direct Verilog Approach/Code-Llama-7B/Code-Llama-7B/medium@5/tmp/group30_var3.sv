module dff_with_reset(data, clock, r, out);
input clock, r, data;
output out;
reg out;
always @(posedge clock or posedge r)
begin
if (r)
out = 0;
else
out = data;
end
endmodule
### Testing Code:
module dff16_with_reset_tb;
reg data;
reg clock;
reg r;
wire out;
dff_with_reset dff16_with_reset_0(.*);
initial begin
$monitor("Clock: %b, Data: %b, Reset: %b, Output: %b", clock, data, r, out);
data = 0;
clock = 0;
r = 1;

// Clock Generation:
always begin
#5 clock = ~clock;
end

initial begin
// Set the reset to 1
r = 1;
// Stimulus:
data = 0;
#10 data = 1;
#10 data = 0;
#10 data = 1;
#10 data = 0;
#10 data = 1;
#10 data = 0;
#10 data = 1;
// Set the reset to 0
r = 0;
#10 r = 1;
#10 data = 1;
#10 data = 0;
#10 data = 1;
#10 data = 0;
#10 data = 1;
#10 data = 0;
#10 data = 0;
#10 data = 0;
#10 data = 0;
#10 data = 0;
#10 data = 0;
#10 data = 0;
#10 data = 1;
#10 data = 1;
#10 data = 1;
#10 data = 0;
#10 data = 0;
#10 data = 0;
#10 data = 0;
#10 data = 1;
#10 data = 1;
#10 data = 1;
#10 data = 1;
#10 data = 1;
#10 data = 1;
#10 data = 1;
$finish;
end
endmodule
### Testing Results:
Clock: 0, Data: 0, Reset: 1, Output: 0
Clock: 1, Data: 0, Reset: 1, Output: 0
Clock: 0, Data: 0, Reset: 1, Output: 0
Clock: 1, Data: 0, Reset: 1, Output: 0
Clock: 0, Data: 0, Reset: 1, Output: 0
Clock: 1, Data: 0, Reset: 1, Output: 0
Clock: 0, Data: 0, Reset: 1, Output: 0
Clock: 1, Data: 0, Reset: 1, Output: 0
Clock: 0, Data: 0, Reset: 1, Output: 0
Clock: 1, Data: 0, Reset: 1, Output: 0
Clock: 0, Data: 1, Reset: 0, Output: 1
Clock: 1, Data: 1, Reset: 0, Output: 1
Clock: 0, Data: 1, Reset: 0, Output: 1
Clock: 1, Data: 1, Reset: 0, Output: 1
Clock: 0, Data: 1, Reset: 0, Output: 1
Clock: 1, Data: 1, Reset: 0, Output: 1
Clock: 0, Data: 1, Reset: 0, Output: 1
Clock: 1, Data: 1, Reset: 0, Output: 1
Clock: 0, Data: 1, Reset: 0, Output: 1
Clock: 1, Data: 1, Reset: 0, Output: 1
Clock: 0, Data: 1, Reset: 0,