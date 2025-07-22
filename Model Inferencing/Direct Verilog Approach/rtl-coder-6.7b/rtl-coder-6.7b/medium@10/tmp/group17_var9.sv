module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
wire [1:0] s;
assign z = c[s];
endmodule