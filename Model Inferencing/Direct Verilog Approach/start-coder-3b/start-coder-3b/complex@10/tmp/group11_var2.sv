module ttst_ttoflipflop(); // Assuming this tests a tristate 2-to-1 flipflop called ttoflop
reg e;
reg [1:0]i; // Should be reg i0, i1; or reg [0:0] i0, i1; or just input wires if MUX takes separate inputs
wire out;
// ttoflop mm(out,e,i,i); // Instantiation requires correct MUX definition
initial
begin
e =0; i = 2'b00; // Added initial's' value
end
always
begin
end
initial $monitor($time," enable e = %b, input i = %b,output out = %b ",e,i,out);
initial #48