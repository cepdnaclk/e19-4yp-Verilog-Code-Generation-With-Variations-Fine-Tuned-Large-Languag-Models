```verilog
typedef enum logic [1:0] {
    ST0_Z,
    ST1_Z,
    ST1,
    ST0
} mux_output;

module mos_strength_enum (a, c, zn, zp);
input logic a, c;
output logic zn, zp;

mux_output mux_output_func;

always_comb begin
    mux_output_func = a? ST1 : ST0;
end

nmos (zn, mux_output_func == ST0_Z || mux_output_func == ST0, c);
pmos (zp, mux_output_func == ST1_Z || mux_output_func == ST1, c);

endmodule
```

In this modified code, we have moved the logic of the xor and and gates into an enum variable'mux_output_func'. We then use this enum variable to represent the output states of the gate. We can test whether the output of the gate is what we expect by checking the'mux_output_func' against its expected value. 

The 'always_comb' block is used to calculate the'mux_output_func' at every time without delay. The 'assign' statement is not needed since we are using a 'always_comb' block for calculating the'mux_output_func' and using 'nmos' and 'pmos' in the next lines. 

This approach allows us to easily test the behavior of the gate with enum values, which provides a more comprehensive way of testing combinational logic. 

Note that this code only works with modelsim tool or similar tools which support enum data type in verilog. Also, 'nmos' and 'pmos' are used to represent the inverter and buffer gate, and their usage is similar to what we do in base code. However, this representation is not necessary for the intended logic and the actual implementation of the gate will depend on the underlying technology.

Please replace `nmos`, `pmos` with appropriate technology-specific gate primitive for your specific technology. The same goes for the enum.

To see the output, use simulation or waveform viewer in the simulation tool to monitor the output signals 'zn