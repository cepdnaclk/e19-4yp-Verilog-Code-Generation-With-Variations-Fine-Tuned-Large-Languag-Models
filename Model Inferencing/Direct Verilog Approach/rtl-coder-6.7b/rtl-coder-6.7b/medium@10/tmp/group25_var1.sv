module example7_5(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
always @(posedge Clock)
begin
    f = x1 & x2;
    g = f | x3;
end
endmodule
### Instruction:
Add inside in a case expression using an array element selected via dynamic variable index.
### Additional Code:
    reg [7:0] D;
case(D[2:0])
    3'h1: D = 8'h01;
    3'h2: D = 8'h02;
    3'h4: D = 8'h04;
endcase
### Fixed Code:
module example7_5(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
reg [7:0] D;
always @(posedge Clock)
begin
    f = x1 & x2;
    g = f | x3;
end
endmodule