[mealy_inside_package_instantiate.sv](mealy_inside_package_instantiate.sv)
### Result:
![mealy_inside_package_instantiate](./images/mealy_inside_package_instantiate.svg)

## FSM With UVM Parameterized State Machine

### Base Verilog Code:
module mealy(Clock, Resetn, w, z);
input Clock, Resetn, w;
output z;
reg y, Y, z;
parameter A =