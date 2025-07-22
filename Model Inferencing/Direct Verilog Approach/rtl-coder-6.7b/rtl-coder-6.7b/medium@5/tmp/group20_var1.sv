module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
reg [3:0] Count_next;
always @(posedge Clk) begin
    if(Reset) Count = 0;
    else Count_next = Count + 1;
end
always @(posedge Clk) begin
    Count <= Count_next;
end
endmodule
### Example Code:
module Chap2Counter(input Clk, Reset, Count);
output [3:0] Count;
reg [3:0] Count;
reg [3:0] Count_next;
always @(posedge Clk) begin
    if(Reset) Count = 0;
    else Count_next = Count + 1;
end
always @(posedge Clk) begin
    if(Reset) Count <= 0;
    else Count <= Count_next;
end
endmodule
### Example Code:
module Chap2Counter(input Clk, Reset, Count);
output [3:0] Count;
reg [3:0] Count;
reg [3:0] Count_next;
always @(posedge Clk) begin
    if(Reset) Count <= 0;
    else begin
        Count_next <= Count + 1;
    end
end
always @(posedge Clk) begin
    if(Reset) Count <= 0;
    else Count <= Count_next;
end
endmodule
### Example Code:
module Chap2Counter(input Clk, Reset, Count);
output [3:0] Count;
reg [3:0] Count;
reg [3:0] Count_next;
always @(posedge Clk) begin
    if(Reset) Count <= 0;
    else begin
        Count_next <= Count + 1;
    end
end
always @(posedge Clk) begin
    Count <= Count_next;
end
endmodule
### Example Code:
module Chap3Counter(input Clk, Reset, Count);
output [3:0] Count;
reg [3:0] Count;
reg [3:0] Count_next;
initial begin
    Count <= 0;
end
always @(posedge Clk) begin
    if(Reset) Count <= 0;
    else begin
        Count_next <= Count + 1;
    end
end
always @(posedge Clk) begin
    Count <= Count_next;
end
endmodule
### Example Code:
module Chap3Counter(input Clk, Reset, Count);
output [3:0] Count;
reg [3:0] Count;
reg [3:0] Count_next;
initial begin
    Count <= 0;
end
always @(posedge Clk) begin
    if(Reset) Count <= 0;
    else begin
        Count_next <= Count + 1;
    end
end
always @(posedge Clk) begin
    Count <= Count_next;
end
endmodule
### Example Code:
module Chap3Counter(input Clk, Reset, Count);
output [3:0] Count;
reg [3:0] Count;
reg [3:0] Count_next;
initial begin
    Count <= 0;
end
always @(posedge Clk) begin
    if(Reset) begin
        Count <= 0;
        Count_next <= 0;
    end
    else begin
        Count_next <= Count + 1;
    end
end
always @(posedge Clk) begin
    Count <= Count_next;
end
endmodule
### Example Code:
module Chap3Counter(input Clk, Reset, Count);
output [3:0] Count;
reg [3:0] Count;
reg [3:0] Count_next;
initial begin
    Count <= 0;
end
always @(posedge Clk) begin
    if(Reset) begin
        Count <= 0;
        Count_next <= 0;
    end
    else begin
        Count_next <= Count + 1;
    end
end
always @(posedge Clk) begin
    Count <= Count_next;
end
endmodule
### Example Code:
module Chap4Counter(input Clk, Reset, Count);
output [3:0] Count;
reg [3:0] Count;
reg [3:0] Count_next;
initial begin
    Count <= 0;
end
always @(posedge Clk) begin
    if(Reset) begin
        Count <= 0;
        Count_next <= 0;
    end
    else begin
        Count_next <= Count + 1;
    end
end
always @(posedge Clk) begin
    Count <= Count_next;
end
endmodule
### Example Code:
module Chap4Counter(input Clk, Reset, Count);
output [3:0] Count;
reg [3:0] Count;
reg [3:0] Count_next;
initial begin
    Count <= 0;
end
always @(posedge Clk or posedge Reset) begin
    if(Reset) begin
        Count <= 0;
        Count_next <= 0;
    end
    else begin
        Count_next <= Count + 1;
    end
end
always @(posedge Clk) begin
    Count <= Count_next;
end
endmodule
### Example Code:
module Chap4Counter(input Clk, Reset, Count);
output [3:0] Count;
reg [3:0] Count;
reg [3:0] Count_next;
initial begin
    Count <= 0;
end
always @(posedge Clk) begin
    if(Reset) begin
        Count <= 0;
        Count_next <= 0;
    end
    else begin
        Count_next <= Count + 1;
    end
end
always @(posedge Clk) begin
    Count <= Count_next;
end
endmodule
### Example Code:
module Chap4Counter(input Clk, Reset, Count);
output [3:0] Count;
reg [3:0] Count;
reg [3:0] Count_next;
initial begin
    Count <= 0;
end
always @(posedge Clk) begin
    if(Reset) begin
        Count <= 0;
        Count_next <= 0;
    end
    else if(~Reset) begin
        Count_next <= Count + 1;
    end
    else begin
        Count <= 0;
        Count_next <= 0;
    end
end
always @(posedge Clk) begin
    Count <= Count_next;
end
endmodule
### Example Code:
module Chap4Counter(input Clk, Reset, Count);
output [3:0] Count;
reg [3:0] Count;
reg [3:0] Count_next;
initial begin
    Count <= 0;
end
always @(posedge Clk) begin
    if(Reset) begin
        Count <= 0;
        Count_next <= 0;
    end
    else if(~Reset) begin
        Count_next <= Count + 1;
    end
end
always @(posedge Clk) begin
    Count <= Count_next;
end
endmodule
### Example Code:
module Chap4Counter(input Clk, Reset, Count);
output [3:0] Count;
reg [3:0] Count;
reg [3:0] Count_next;
initial begin
    Count <= 0;
end
always @(posedge Clk) begin
    if(Reset) begin
        Count <= 0;
        Count_next <= 0;
    end
    else if(~Reset) begin
        Count_next <= Count + 1;
    end
    else begin
        Count <= 0;
        Count_next <= 0;
    end
end
always @(posedge Clk) begin
    Count <= Count_next;
end
endmodule
### Example Code:
module Chap4Counter(input Clk, Reset, Count);
output [3:0] Count;
reg [3:0] Count;
reg [3:0] Count_next;
initial begin
    Count <= 0;
end
always @(posedge Clk) begin
    if(Reset) begin
        Count <= 0;
        Count_next <= 0;
    end
    else if(~Reset) begin
        Count_next <= Count + 1;
    end
    else if(Reset) begin
        Count <= 0;
        Count_next <= 0;
    end
    else begin
        Count <= 0;
        Count_next <= 0;
    end
end
always @(posedge Clk) begin
    Count <= Count_next;
end
endmodule
### Example Code:
module Chap4Counter(input Clk, Reset, Count);
output [3:0] Count;
reg [3:0] Count;
reg [3:0] Count_next;
initial begin
    Count <= 0;
end
always @(posedge Clk) begin
    if(Reset) begin
        Count <= 0;
        Count_next <= 0;
    end
    else if(~Reset) begin
        Count_next <= Count + 1;
    end