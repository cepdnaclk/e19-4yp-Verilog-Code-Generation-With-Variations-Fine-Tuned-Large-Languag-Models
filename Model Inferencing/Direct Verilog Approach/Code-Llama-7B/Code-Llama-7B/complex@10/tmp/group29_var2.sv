module hex_to_7seg(a, seg);
input [3: 0] a;
output [6: 0] seg;
reg [6: 0] seg;
// inside is a special syntax for use inside a module to specify a comparison between a and an array
// inside is a one time statement, a should be initialized, and this statement should be inside always block
// inside is a little bit different among different languages
// it is a special syntax for use inside a module to specify a comparison between a and an array
// inside is a one time statement, a should be initialized, and this statement should be inside always block
// inside is a little bit different among different languages
always @ (a) begin
if (a inside [0: 9]) begin
seg = a;
end
else begin
seg = 7'b1111111;
end
end
endmodule
### Modified Testbench:
module hex_to_7seg_tb;
reg [3: 0] a;
wire [6: 0] seg;
hex_to_7seg dut(a, seg);
initialize();
end
task initialize;
begin
a = 5; #10;
a = 8; #10;
a = 13; #10;
end
endtask
endmodule