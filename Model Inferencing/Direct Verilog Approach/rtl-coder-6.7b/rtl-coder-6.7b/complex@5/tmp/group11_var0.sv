module ttst_ttrimux2_1(); // Assuming this tests a tristate 2-to-1 mux called ttrimux2_1
reg e;
reg [1:0]i; // Should be reg i0, i1; or reg [0:0] i0, i1; or just input wires if MUX takes separate inputs
wire out; // Added wire declaration
generate
begin : mm // Added a label to identify multiplexer
// Instantiation requires correct MUX definition
ttrimux2_1 mm (out,e,i,s); // MUX with s
initial
begin
e =0; i = 2'b00; s = 1'b0; // Added initial's' value
end
always
begin
end
initial $monitor($time," enable e = %b, s= %b, input i = %b,output out = %b ",e,s,i,out);
initial #48 $stop;
end
end
endgenerate
generate
begin : mm // Added a label to identify multiplexer
// Instantiation requires correct MUX definition
ttrimux2_1 mm (out,e,i,s); // MUX with s
initial
begin
e =0; i = 2'b00; s = 1'b1; // Added initial's' value
end
always
begin
end
initial $monitor($time," enable e = %b, s= %b, input i = %b,output out = %b ",e,s,i,out);
initial #48 $stop;
end
end
endgenerate