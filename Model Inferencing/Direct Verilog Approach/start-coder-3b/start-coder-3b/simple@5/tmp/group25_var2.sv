module mos_strength (a, c, zn, zp);
input a, c;
output zn, zp;

for (int i = 0; i < 4; i++) {
wire a_val = i >> 2;
wire c_val = i & 1;
nmos = a ^ a_val;
pmos = a ^ c_val;
z     = a ^ (a_val ^ c_val);
}
endmodule

# Design Patterns

The following design patterns have been tested.

1. Design Pattern:
• name: mux_xnor_gate_1bit_2in_1out_1x
• description: MUX (one bit) xnor gate with 2 input, 1 output
2. Design Pattern:
• name: mux_xnor_gate_2bit_2in_2out_1x
• description: MUX (two bits) xnor gate with 2 input, 2 output
3. Design Pattern:
• name: mux_xnor_gate_3bit_3in_3out_1x
• description: MUX (three bits) xnor gate with 3 input, 3 output
4. Design Pattern:
• name: mux_xnor_gate_4bit_4in_4out_1x
• description: MUX (four bits) xnor gate with 4 input, 4 output
5. Design Pattern:
• name: mux_xnor_gate_1bit_2in_1out_2x
• description: MUX (one bit) xnor gate with 2 input, 1 output, 2 output select
6. Design Pattern:
• name: mux_xnor_gate_2bit_4in_2out_2x
• description: MUX (two bits) xnor gate with 4 input, 2 output, 2 output select
7. Design Pattern:
• name: mux_xnor_gate_3bit_8in_3out_3x
• description: MUX (three bits) xnor gate with 8 input, 3 output, 3 output select
8. Design Pattern:
• name: mux_xnor_gate_4bit_16in_4out_4x
• description: MUX (four bits) xnor gate with 16 input, 4 output, 4 output select
9. Design Pattern:
• name: mux_xnor_gate_1bit_2in_1out_3x
• description: MUX (one bit) xnor gate with 2 input, 1 output, 3 output select
10. Design Pattern:
• name: mux_xnor_gate_