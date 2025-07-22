module Register_File(read_out, write_out, read_in, write_in, sel, clk, rst);
output reg [3: 0] read_out, write_out;
input [3: 0] read_in, write_in;
input [15: 0] sel;
input clk, rst;
parameter Instruction_Count = 9;
integer i;
reg [3: 0] read_out, write_out; // 10-12-2004
reg [15: 0] write_in, read_in;
reg [15: 0] ReadData1, ReadData2;
parameter Instruction_Array [Instruction_Count - 1: 0] = {
4'bxx, 4'b00, 4'b10, 4'b01,
4'b11, 4'b00, 4'b01,
4'b22, 4'b00, 4'b00};

always @ (posedge clk) begin
if (rst) begin
end else
case (sel)
4'b00 : begin
write_in <= 0;
read_out <= 0;
end
end

always @ (posedge clk) begin
if (rst) begin
end else
case (sel)
4'b01 : begin
write_in <= 10'h111;
read_out <= 10'h111;
end
4'b10 : begin
write_in <= 10'h123;
read_out <= 10'h123;
end
4'b11 : begin
write_in <= 10'h123;
read_out <= 10'h123;
end
end

always @ (posedge clk) begin
if (rst) begin
end else
case (Instruction_Array[i])
4'bxx : i <= i;
4'b00 : i <= i;
4'b01 : i <= i + 1;
4'b10 : i <= i + 3;
4'b11 : i <= i;
4'b22 : i <= i;
end
end

always @ (posedge clk) begin