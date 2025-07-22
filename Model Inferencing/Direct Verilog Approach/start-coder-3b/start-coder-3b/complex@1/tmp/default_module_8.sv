module Add (output, input1, input2, carry_in, carry_out);
input carry_in, carry_out;
input [63: 0] input1, input2;
output [63: 0] output;
always @ (*)
output = input1 ^ input2 ^ carry_in ^ carry_out;
endmodule

module Add_Wrapper (output, input1, input2, carry_in, carry_out);
output reg [63: 0] output;
input [64: 0] input1, input2;
input carry_in, carry_out;
integer i;
generate
for (i = 0; i < 8; i = i + 1)
Add M0 (output[i], input1[i], input2[i], carry_in, carry_out);
generate
end
endgenerate
endmodule

module t_Add_Wrapper ();
wire [64: 0] output, input1, input2;
reg carry_in, carry_out;
wire [5: 0] carry_in, carry_out;
Add_Wrapper M0 (output, input1, input2, carry_in, carry_out);
initial #500 $finish;
endmodule