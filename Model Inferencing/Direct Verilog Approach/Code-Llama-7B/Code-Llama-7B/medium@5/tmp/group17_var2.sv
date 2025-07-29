module mux41b #(parameter n=4, parameter o=4'b0000)(input wire [n-1:0] c, input wire [3:0] s, output wire [3:0] z);
always_comb
begin
    casex(s)
        4'b0000:z = c[0];
        4'b0001:z = c[1];
        4'b0010:z = c[2];
        4'b0011:z = c[