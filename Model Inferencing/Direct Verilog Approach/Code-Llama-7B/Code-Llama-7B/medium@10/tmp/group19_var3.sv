module counter_381 (
    input wire clk, rst,
    output reg [7:0] count,
    output reg [3:0] count_381
);
wire [3:0] internal;
initial begin
    internal <= count[3:0];
    count_381 <= internal;
end
always @(posedge clk or posedge rst) begin
    if (rst) count <= 8'b00000000;
    else count <= count + 1;
end
endmodule
### Variation Verilog Code:
module counter_382 (
    input wire clk, rst,
    output reg [7:0] count,
    output reg [3:0] count_382
);
always @(posedge clk or posedge rst) begin
    if (rst) count <= 8'b00000000;
    else count <= count + 1;
end
assign count_382 = count[3:0];
endmodule
### Variation Verilog Code:
module counter_383 (
    input wire clk, rst,
    output reg [7:0] count,
    output reg [3:0] count_383
);
always @(posedge clk or posedge rst) begin
    if (rst) count <= 8'b00000000;
    else count <= count + 1;
end
assign count_383 = count[3:0];
endmodule
### Variation Verilog Code:
// Avoid use of [3:0] slice
module counter_384 (
    input wire clk, rst,
    output reg [7:0] count,
    output reg [3:0] count_384
);
always @(posedge clk or posedge rst) begin
    if (rst) count <= 8'b00000000;
    else count <= count + 1;
end
assign count_384 = count[7:4];
endmodule
### Variation Verilog Code:
// Avoid use of [3:0] slice
module counter_385 (
    input wire clk, rst,
    output reg [7:0] count,
    output reg [3:0] count_385
);
always @(posedge clk or posedge rst) begin
    if (rst) count <= 8'b00000000;
    else count <= count + 1;
end
assign count_385 = count;
endmodule
### Variation Verilog Code:
module counter_386 (
    input wire clk, rst,
    output reg [7:0] count,
    output reg [3:0] count_386
);
always @(posedge clk or posedge rst) begin
    if (rst) count <= 8'b00000000;
    else count <= count + 1;
end
assign count_386 = count[7:4];
endmodule
### Variation Verilog Code:
module counter_387 (
    input wire clk, rst,
    output reg [7:0] count,
    output reg [3:0] count_387
);
always @(posedge clk or posedge rst) begin
    if (rst) count <= 8'b00000000;
    else count <= count + 1;
end
assign count_387 = count;
endmodule
### Variation Verilog Code: