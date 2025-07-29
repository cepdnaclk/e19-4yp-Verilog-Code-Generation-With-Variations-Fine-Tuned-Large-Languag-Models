module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
assign z = 
case(s) // s[1] determines the case
1'b00: c[0]
1'b01: c[1]
1'b10: c[2]
1'b11: c[3]
endcase;
endmodule
### Verification Steps:
1. Run and see the 4 outputs are 1's only.
### Expected Output
z = 1 when c[0] = 1;
z = 1 when c[1] = 1;
z = 1 when c[2] = 1;
z = 1 when c[3] = 1;
### Simulation Screens