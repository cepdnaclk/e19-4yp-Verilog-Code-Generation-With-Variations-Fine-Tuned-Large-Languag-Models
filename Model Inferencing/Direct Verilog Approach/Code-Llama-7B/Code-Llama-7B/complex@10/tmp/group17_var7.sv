```verilog 
// Parameters
parameter N = 8;
parameter NUM_ARRAYS = 8;
// Inputs
reg [N-1:0] x [NUM_ARRAYS];
reg [N-1:0] y [NUM_ARRAYS];
// Outputs
wire gt [NUM_ARRAYS];
wire eq [NUM_ARRAYS];
wire lt [NUM_ARRAYS];
// Instantiate comparator
comp cmp (.x(x[1]),.y(y[1]),.gt(gt[1]),.eq(eq[1]),.lt(lt[1]));
genvar i;
generate
for(i = 0; i < NUM_ARRAYS; i = i + 1) begin
assign x[i] = i;
assign y[i] = i * 2;
end
endgenerate
initial begin
$monitor("%d > %d = %b", x[i], y[i], comp.gt);
$monitor("%d == %d = %b", x[i], y[i], comp.eq);
$monitor("%d < %d = %b", x[i], y[i], comp.lt);
$display($time);
$monitor("%d > %d = %b", x[1], y[1], cmp.gt);
$monitor("%d == %d = %b", x[1], y[1], cmp.eq);
$monitor("%d < %d = %b", x[1], y[1], cmp.lt);
end
endmodule
```