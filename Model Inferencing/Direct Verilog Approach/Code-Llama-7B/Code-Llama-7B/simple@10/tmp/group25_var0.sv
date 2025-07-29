module mos_strength_enum (a, c, zn, zp);
input a, c;
output [1:0] zn, zp;
// Enum declarations
typedef enum bit [1:0] {St0 = 2'b00, St1 = 2'b01, Z  = 2'b10} state_e;
localparam state_e Zn = St0, Zp = St1;
// Define state signals
wire [1:0] a_c, z0_p, z1_n, z2_zn, z3_zp;
assign a_c = a & c;
assign z0_p = (a_c)? St1 : St0;
assign z1_n = (a_c)? St1 : St0;
assign z2_zn = (a_c)? St0 : Z;
assign z3_zp = (a_c)? Z : St1;
assign zn = (a_c)? z0_p : z2_zn;
assign zp = (a_c)? z1_n : z3_zp;
endmodule
### Simulation Setup
Testbench:
module testbench();
mos_strength dut(.*);
endmodule
Inputs:
module test_inputs();
initial begin
$monitor("a=%b, c=%b, zn=%b, zp=%b", dut.a, dut.c, dut.zn, dut.zp);

$monitor("a=%b, c=%b, zn=%b, zp=%b", dut.a, dut.c, dut.zn, dut.zp);

end
endmodule
Test Bench Simulation:
module simulation();
mos_strength_enum dut(.*);
initial begin
$monitor("a=%b, c=%b, zn=%b, zp=%b", dut.a, dut.c, dut.zn, dut.zp);

$monitor("a=%b, c=%b, zn=%b, zp=%b", dut.a, dut.c, dut.zn, dut.zp);

end
endmodule
Test Results:
```
### Verification