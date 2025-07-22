module test;
wire a;
logic clk;
wire clk_n;
assign clk_n = clk;
struct packed {logic x, y, z;} s;
assign #25 a = 1;
always begin
    ##10 s.z = #10 a;
    ##10 s.y = #10 a;
    ##10 s.x = #10 a;
    ##10 s.y = #10 a;
    ##10 s.z = #10 a;
    ##10 s.x = #10 a;
end
always begin
    clk = 1;
    ##1 clk = 0;
    ##1 clk = 1;
    ##1 clk = 0;
    ##1 clk = 1;
    ##1 clk = 0;
end
endmodule