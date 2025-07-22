module mixed_sim;
reg dcontrol, x, y;
reg [31:0] data;
wire [31:0] bus;
assign bus = dcontrol? data : 'bz;
always @x
y = ~x;
initial
begin
$monitor("time=%d dcontrol=%d data=%d x=%d y=%d bus=%d",
         $time, dcontrol, data, x, y, bus);
dcontrol = 0;
end
endmodule
testbench.sv:19:1: error: The operand type'string' is incompatible with the
operand type 'integer'.
testbench.sv:19:1: note: In the expression:
testbench.sv:19:1: note: The operator isn't compatible with the types.