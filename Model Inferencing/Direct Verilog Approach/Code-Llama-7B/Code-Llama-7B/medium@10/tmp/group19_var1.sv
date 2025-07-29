module counter (
    input wire clk, rst,
    output reg [3:0] count
);
initial begin
    count[1:0] = 2'b00;
end
always @(posedge clk or posedge rst) begin
    if (rst) count <= 4'b0000;
    else count <= count + 1;
end
endmodule
### Trace Table:
| #(s) | clk |                  |
|------|-----|------------------|
|    0 | 0   | (1, count = 0)   |
|    1 | 0   | (2, count = 1)   |
|    2 | 0   | (3, count = 2)   |
|    3 | 1   | (2, count = 3)   |
|    4 | 1   | (3, count = 4)   |
|    5 | 1   | (4, count = 5)   |
|    6 | 1   | (5, count = 6)   |
|    7 | 1   | (6, count = 7)   |
|    8 | 1   | (7, count = 8)   |
|    9 | 1   | (8, count = 9)   |
|   10 | 1   | (9, count = 10)  |
|   11 | 1   | (10, count = 11) |
|   12 | 1   | (11, count = 12) |
|   13 | 1   | (12, count = 13) |
|   14 | 1   | (13, count = 14) |
|   15 | 1   | (14, count = 15) |
|   16 | 1   | (15, count = 16) |
|   17 | 1   | (16, count = 17) |
|   18 | 1   | (17, count = 18) |
|   19 | 1   | (18, count = 19) |
|   20 | 1   | (19, count = 20) |
|   21 | 1   | (20, count = 21) |
|   22 | 1   | (21, count = 22) |
|   23 | 1   | (22, count = 23) |
|   24 | 1   | (23, count = 24) |
|   25 | 1   | (24, count = 25) |
|   26 | 1   | (25, count = 26) |
|   27 | 1   | (26, count = 27) |
|   28 | 1   | (27, count = 28) |
|   29 | 1   | (28, count = 29) |
|   30 | 1   | (29, count = 30) |
|   31 | 1   | (30, count = 31) |
|   32 | 1   | (31, count = 32) |
|   33 | 1   | (32, count = 33) |
|   34 | 1   | (33, count = 34) |
|   35 | 1   | (34, count = 35) |
|   36 | 1   | (35, count = 36) |
|   37 | 1   | (36, count = 37) |
|   38 | 1   | (37, count = 38) |
|   39 | 1   | (38, count = 39) |
|   40 | 1   | (39, count = 40) |
|   41 | 1   | (40, count = 41) |
|   42 | 1   | (41, count = 42) |
|   43 | 1   | (42, count = 43