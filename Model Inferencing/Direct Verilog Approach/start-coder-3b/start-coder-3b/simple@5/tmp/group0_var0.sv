module wire_assign_to_logic_wire_1(input in, output logic_wire_1 out);
    assign out = in;
endmodule
### Tested On:
```bash
verilator --sv -Wall -I. --cc wire_assign_to_logic_wire_1.sv
make -j8 -C obj_dir -f Vwire_assign_to_logic_wire_1.mk Vwire_assign_to_logic_wire_1
obj_dir/Vwire_assign_to_logic_wire