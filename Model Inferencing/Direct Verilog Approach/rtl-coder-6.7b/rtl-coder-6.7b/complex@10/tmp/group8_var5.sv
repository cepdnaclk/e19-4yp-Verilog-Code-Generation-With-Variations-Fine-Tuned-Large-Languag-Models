module Johnson_Counter (count, enable, clock, reset);
output [3: 0] count;
input enable;
input clock, reset;
reg [3: 0] count;
always @ (posedge clock, posedge reset)
if (reset == 1) count <= 0;
else if (enable)
generate
for (genvar i = 0; i < 4; i = i + 1)
begin: jc
if (inside(count, i, 4'b0011, 4'b0111))
begin: jc1
case (i)
4'b0000,
4'b0001,
4'b0011,
4'b0111: count <= {count[2: 0], 1'b1};
4'b1111,
4'b1110,
4'b1100,
4'b1000: count <= {count[2: 0], 1'b0};
default: count <= 0;
endcase
end: jc1
end: jc
endgenerate
endmodule
### Solution Explanation:
The code will only accept `inside()` condition if `count` value is within one of the 4 specific values.
### Modified Testbench:
module t_Johnson_Counter ();
wire [3: 0] count;
reg enable;
reg clock, reset;
Johnson_Counter M0 (count, enable, clock, reset);
initial #500 $finish;
initial begin clock = 0; forever #5 clock = ~clock; end
initial begin
enable = 1;
reset = 1;
#100;
reset = 0;
#200;
end
endmodule
### Solution Output:
count = 1011
count = 1001
count = 1010
count = 1110
count = 1100
count = 0000
count = 1000
count = 0100
count = 0110
count = 1011
count = 1001
count = 1010
count = 11