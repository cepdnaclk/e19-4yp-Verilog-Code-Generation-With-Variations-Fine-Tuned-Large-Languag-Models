<img src="https://github.com/SakalShrestha/Verification-of-RTL-Design/blob/master/Verilog/alu/alu_inside_array_with_interface/alu.png" width="500"/>

## Question No.022:
### Base Verilog Code:
module dpa(data, addr, wr, cen, out);
input  data, addr, wr, cen;
output out;
reg out;

parameter n = 16;
localparam [n-1:0] adr_msk = {~0, ~0, ~0, ~0, ~0, ~0, ~0, ~0, ~0, ~0, ~0, ~0, ~0, ~0, ~0, ~0};
localparam adr_msk2 = {~0, ~0, ~0, ~0, ~0, ~0, ~0, ~0, ~0, ~0, ~0, ~0, ~0, ~0, 6'b011111, 6'b000000};

reg [6:0] addr_dec;
reg [2:0] addr_