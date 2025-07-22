module add_sub (A_in, B_in, Sum_Out, Dif_Out);
input A_in, B_in;
output Sum_Out, Dif_Out;

always @(A_in or B_in) begin
Sum_Out = (A_in and B_in)? 0 : (A_in and not B_in)? 0 : (not A_in and B_in)? 1 : 0;
Dif_Out = (A_in and B_in)? 0 : (A_in and not B_in)? 1 : (not A_in and B_in)? 0 : 0;
end
endmodule

module t_add_sub();
reg [3:0] A_in, B_in;
wire [3:0] Sum_Out, Dif_Out;
add_sub M0(A_in, B_in, Sum_Out, Dif_Out);
initial begin
A_in = 4'b1010;
B_in = 4'b0101;
end

initial begin //Simulation Test Pattern
for (int i = 0; i < 16; i = i + 1) begin
A_in = 4'b1010;
B_in = 4'b0101;
end
end
endmodule

## 1.5 Exercise:
### Base Verilog Code:
module decoder (data, addr, data_out, ack);
output [3:0] data_out;
output ack;
input [3:0] data;
input [2:0] addr;

always @(data or addr) begin
case (addr)
4'b0000: begin
data_out = 4'b0000;
end
4'b0001: begin
data_out = 4'b0001;
end
4'b0010: begin
data_out = 4'b0010;
end
4'b0011: begin
data_out = 4'b0011;
end
4'b0100: begin
data_out = 4'b0100;
end
4'b0101: begin
data_out = 4'b0101;
end
4'b0110: begin
data_out = 4'b0110;
end
4'b0111: begin
data_out = 4'b0111;
end
4'b1000: begin
data_out = 4'b1000;
end
4'b1001: begin
data_out = 4'b1001;
end
4'b1010: begin
data_out = 4'b1010;
end
4'b1011: begin
data_out = 4'b1011;
end
4'b1100: begin
data_out = 4'b1100;
end
4'b1101: begin
data_out = 4'b1101;
end
4'b1110: begin
data_out = 4'b1110;
end
4'b1111: begin
data_out = 4'b1111;
end
default: begin
data_out = 4'b0000;
end
endcase
end
endmodule

module t_decoder();
reg [3:0] data;
reg [2:0] addr;
wire [3:0] data_out;
wire ack;
decoder M0(data, addr, data_out, ack);
initial begin
data = 4'b0000;
end

initial begin //Simulation Test Pattern
end
endmodule

### Vari