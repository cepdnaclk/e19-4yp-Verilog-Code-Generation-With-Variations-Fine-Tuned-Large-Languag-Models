module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
wire [3:0] q; // temporary wire of 4 bits to hold selected inputs
assign q[0] = ~s[1] & ~s[0] & c[0];
assign q[1] = ~s[1] & s[0] & c[1];
assign q[2] = s[1] & ~s[0] & c[2];
assign q[3] = s[1] & s[0] & c[3]; // Assigning the temporary wire with c as input with respect to s
assign z = c[s]; // Assigning output
endmodule
### Solution Check: