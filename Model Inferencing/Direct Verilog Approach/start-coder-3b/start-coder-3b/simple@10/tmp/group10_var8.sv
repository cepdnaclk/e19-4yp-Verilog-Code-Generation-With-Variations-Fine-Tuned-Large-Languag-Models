module alu(out,o_sum,o_co,o_ci);
input [3:0]i;
input [3:0]j;
input [1:0]f;
input ci;
output [1:0]co;
output [3:0]sum;

reg [1:0] c_in;
reg [3:0] s_in;
reg [3:0] i_in;
reg [3:0] j_in;

always@(*)(ci == 1'b1) begin
c_in <= 3'b1;
end

always@(*)(ci == 1'b0) begin
c_in <= 3'b0;
end

always@(*)(f == 3'b000) begin
s_in <= i_in + j_in + c_in;
end

always@(*)(f == 3'b001) begin
s_in <= i_in + j_in;
end

always@(*)(f == 3'b010) begin
s_in <= i_in - j_in;
end

always@(*)(f == 3'b011) begin
s_in <= i_in - j_in + c_in;
end

always@(*)(f == 3'b100) begin
s_in <= i_in * j_in;
end

always@(*)(f == 3'b101) begin
s_in <= i_in * j_in + c_in;
end

always@(*)(f == 3'b110) begin
s_in <= i_in / j_in;
end

always@(*)(f == 3'b111) begin
s_in <= i_in / j_in + c_in;
end

assign o_co = c_in;
assign o_sum = s_in;
endmodule

### Simulation Output:

![alu](https://user-images.githubusercontent.com/79090949/118186105-5a866300-b408-11eb-8576-286742286ee2.PNG)

> **Notice:**
> No error reported.
> Functionality tested correctly.

## 1.5 : rom

**Q:** Implement a 4-bit ALU with the following inputs and outputs:

![rom](https://user-images.githubusercontent.com/79090949/118186508-c953bd00-b408-11eb-9707-5579477e3d2b.PNG)

**Ans:**
### Base Verilog Code:
module rom(out, ci, f);
input [3:0] f;
output ci;
output [3:0] out;

reg [3:0] rom_table [0:15];
wire [1:0] rom_ci;

always@(*) begin
case (f)
3'b000: rom_ci = 2'b00;
3'b001: rom_ci = 2'b01;
3'b010: rom_ci = 2'b10;
3'b011: rom_ci = 2'b11;
3'b100: rom_ci = 2'b10;
3'b101: rom_ci = 2'b11;
3'b110: rom_ci = 2'b01;
3'b111: rom_ci = 2'b00;
default: rom_ci = 2'bxx;
endcase
end
assign rom_ci = 2'b10;
assign out = rom_table[f];

reg [3:0] r_f;
always@(*) begin
r_f = f;
end

always@(*) begin
if (r_f == 3'b000) begin rom_table[3'b000] = 4'h0; end
if (r_f == 3'b001) begin rom_table[3'b001] = 4'h1; end
if (r_f == 3'b010) begin rom_table[3'b010] = 4'h2; end
if (r_f == 3'b011) begin rom_table[3'b011] = 4'h3; end
if (r_f == 3'b100) begin rom_table[3'b100] = 4'h4; end
if (r_f == 3'b101) begin rom_table[3'b101] = 4'h5; end
if (r_f == 3'b110) begin rom_table[3'b110] = 4'h6; end
if (r_f == 3'b111) begin rom_table[3'b111] = 4'h7; end
endmodule

### Variation Instruction:
To test the ROM