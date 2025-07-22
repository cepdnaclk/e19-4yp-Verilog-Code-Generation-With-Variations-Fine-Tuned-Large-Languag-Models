module mux21b_1 (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
wire [1:0][1:0] sel;
wire [1:0] out; // Outputs for mux21b
assign sel = {{s},{~s}}; // Assign to array
mux21b mux21b_1 (a,b,sel[0],out[0]); // Output selection
mux21b mux21b_2 (a,b,sel[1],out[1]); // Output selection
priority case (1'b1) // Priority case
out[1]: y = 1'b1; // Select 1 if out[1]=1
out[0]: y = 1'b0; // Select 0 if out[1]=0
default:
y = 1'b0; // If nothing selected, select 0
endcase
endmodule