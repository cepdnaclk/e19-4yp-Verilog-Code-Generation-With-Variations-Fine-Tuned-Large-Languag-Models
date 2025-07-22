module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
initial $monitor( "s=%b, c=%b, z=%b", s, c, z );
wire [1:0] t = s ;
wire [3:0] p = c ;
assign z = p [t] ; // Select c[s]
endmodule