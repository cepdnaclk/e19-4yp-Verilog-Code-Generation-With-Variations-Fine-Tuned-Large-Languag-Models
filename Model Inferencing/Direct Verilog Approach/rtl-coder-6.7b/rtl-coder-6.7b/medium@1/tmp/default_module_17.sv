module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
assign z = c[s];
endmodule