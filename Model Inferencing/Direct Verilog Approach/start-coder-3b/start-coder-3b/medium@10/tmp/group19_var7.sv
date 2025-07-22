module counter (
    input wire clk, rst,
    output wire [3:0] count
);
always @(posedge clk or posedge rst) begin
    if (rst) count <= 4'b0000;
    else count <= counter_next;
end
endmodule



# 2016-07-17
# 
#

# Instructions:
The following instructions will be implemented based on the counter module:

# Instruction 1:
ADD [8:16] a, a, 0
a = a + a
# Instruction 2:
ADD [8:16] b, b, 0
b = a + b
# Instruction 3:
SUB [8:16] c, c, 0
c = c - c
# Instruction 4:
SUB [8:16] d, d, 0
d = d - d
# Instruction 5:
AND [127:120] a, a, 0
a = a & 255'h00
# Instruction 6:
AND [127:120] b, b, 0
b = b & 127'h00
# Instruction 7:
XOR [127:120] c, c, 0
c = c ^ 255'h00000000
# Instruction 8:
XOR [127:120] d, d, 0
d = d ^ 127'h0000000000000000

# Base Verilog Code:
module counter (
    input wire clk, rst,
    output reg [3:0] count
);
always @(posedge clk or posedge rst) begin
    if (rst) count <= 4'b0000;
    else count <= count + 1;
end
endmodule

# Variation Instruction 1:
module counter (
    input wire clk, rst,
    output wire [8:16] result
);
always @(posedge clk or posedge rst) begin
    if (rst) result <= 8'd0;
    else result <= result + result;
end
endmodule
# Variation Instruction 2:
module counter (
    input wire clk, rst,
    output wire [8:16] result
);
always @(posedge clk or posedge rst) begin
    if (rst) result <= 8'd0;
    else result <= result + b;
end
endmodule
# Variation Instruction 3:
module counter (
    input wire clk, rst,
    output wire [8:16] result
);
always @(posedge clk or posedge rst) begin
    if (rst) result <= 8'd0;
    else result <= result - result;
end
endmodule
# Variation Instruction 4:
module counter (
    input wire clk, rst,
    output wire [8:16] result
);
always @(posedge clk or posedge rst) begin
    if (rst) result <= 8'd0;
    else result <= result - d;
end
endmodule
# Variation Instruction 5:
module counter (
    input wire clk, rst,
    output wire [127:120] result
);
always @(posedge clk or posedge rst) begin
    if (rst) result <= 127'h00;
    else result <= result & 255'h00;
end
endmodule
# Variation Instruction 6:
module counter (
    input wire clk, rst,
    output wire [127:120] result
);
always @(posedge clk or posedge rst) begin
    if (rst) result <= 127'h00;
    else result <= result & 127'h00;
end
endmodule
# Variation Instruction 7:
module counter (
    input wire clk, rst,
    output wire [127:120] result
);
always @(posedge clk or posedge rst) begin
    if (rst) result <= 127'h00000000;
    else result <= result ^ 255'h00000000;
end
endmodule
# Variation Instruction 8:
module counter (
    input wire clk, rst,
    output wire [127:120] result
);
always @(posedge clk or posedge rst) begin
    if (rst) result <= 127'h0000000000000000;
    else result <= result ^ 127'h0000000000000000;
end
endmodule

# Instruction 3:
module counter (
    input wire clk, rst,
    output wire [8:16] result
);
always @(posedge clk or posedge rst) begin
    if (rst) result <= 8'd0;
    else result <= result - result;
end
endmodule
# Instruction 7:
module counter (
    input wire clk, rst,
    output wire [127:120] result
);
always @(posedge clk or posedge rst) begin
    if (rst) result <= 127'h00000000;
    else result <= result ^ 255'h00000000;
end
endmodule

# Instruction 1:
module counter (
    input wire clk, rst,
    output wire [8:16] result
);
always @(posedge clk or posedge rst) begin
    if (rst) result <= 8'd0;
    else result <= result + result;
end
endmodule
# Instruction 5:
module counter (
    input wire clk, rst,
    output wire [127:120] result
);
always @(posedge clk or posedge rst) begin
    if (rst) result <= 127'h00;
    else result <= result & 255'h00;
end
endmodule

# Instruction 2:
module counter (
    input wire clk, rst,
    output wire [8:16] result
);
always @(posedge clk or posedge rst) begin
    if (rst) result <= 8'd0;
    else result <= result + b;
end
endmodule
# Instruction 6:
module counter (
    input wire clk, rst,
    output wire [127:120] result
);
always @(posedge clk or posedge rst) begin
    if (rst) result <= 127'h00;
    else result <= result & 127'h00;
end
endmodule


# Instructions:
The following instructions will be implemented based on the counter module:

# Instruction 1:
ADD [8:16] a, a, 0
a = a + a
# Instruction 2:
ADD [8:16] b, b, 0
b = a + b
# Instruction 3:
SUB [8:16] c, c, 0
c = c - c
# Instruction 4:
SUB [8:16] d, d, 0
d = d - d
# Instruction 5:
AND [127:120] a, a, 0
a = a & 255'h00
# Instruction 6:
AND [127:120] b, b, 0
b = b & 127'h00
# Instruction 7:
XOR [127:120] c, c, 0
c = c ^ 255'h00000000
# Instruction 8:
XOR [127:120] d, d, 0
d = d ^ 127'h0000000000000000

# Base Verilog Code:
module counter (
    input wire clk, rst,
    output reg [3:0] count
);
always @(posedge clk or posedge rst) begin
    if (rst) count <= 4'b0000;
    else count <= count + 1;
end
endmodule

# Variation Instruction 1:
module counter (
    input wire clk, rst,
    output wire [8:16] result
);
always @(posedge clk or posedge rst) begin
    if (rst) result <= 8'd0;
    else result <= result + result;
end
endmodule
# Variation Instruction 2:
module counter (
    input wire clk, rst,
    output wire [8:16] result
);
always @(posedge clk or posedge rst) begin
    if (rst) result <= 8'd0;
    else result <= result + b;
end