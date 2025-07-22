module IR (input a11, a12, a13, a14, a21, a22, a23, a24, load, clk,
output reg [7:0] data_out );
// Simple register (Instruction Register) loaded on posedge clk when load is high
reg [1:0] A [0:1][0:3];
always @( posedge clk )
begin
A[0][0] = a11;
A[0][1] = a12;
A[0][2] = a13;
A[0][3] = a14;
A[1][0] = a21;
A[1][1] = a22;
A[1][2] = a23;
A[1][3] = a24;
end
always @( posedge clk )
if ( load & outside { A[0][1], A[1][2] } ) data_out <= 2'b10;
// The following statement is synthesizable but not in the original Verilog
// if ( load & outside { {A[0][1],A[1][2]} } ) data_out <= 2'b10;
endmodule