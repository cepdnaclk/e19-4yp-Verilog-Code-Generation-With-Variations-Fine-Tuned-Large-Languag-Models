<img src="Images/alu8_4bit_inputs.png" width="700" height="600">

## ALU 9
<img src="Images/alu9.png" width="700" height="600">
### Base Verilog Code:
module tst_alu9();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d; wire co;
  alu_1 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00;