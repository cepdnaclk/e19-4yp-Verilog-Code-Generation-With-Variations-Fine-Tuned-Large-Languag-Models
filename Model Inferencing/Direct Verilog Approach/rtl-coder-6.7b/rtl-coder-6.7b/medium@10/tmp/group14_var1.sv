module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
reg [1:0] [1:0] table;
assign table [0][0] = 0;
assign table [1][0] = 1;
assign table [0][1] = 1;
assign table [1][1] = 0;
always @(*) // Combinational sensitivity
priority case (1'b1)
table [s][0] : // s=0
y = 0;
table [s][1] : // s=1
y = 1;
endcase
endmodule