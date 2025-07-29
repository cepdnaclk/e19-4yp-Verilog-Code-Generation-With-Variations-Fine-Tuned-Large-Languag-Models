module alu(s, A, B, F);
input [2:0] s;
input [3:0] A, B;
output [3:0] F;
reg [3:0] F;
wire [3:0] B_sel = B;
wire [3:0] A_sel = A;
parameter [3:0] zero_val = 4'b0000;

reg [3:0] zero_val_range [7:0];

genvar i;
generate
  for(i=7; i>=0; i--) begin: array_range
    assign zero_val_range[i] = zero_val + i;
  end
endgenerate

always @(s or A or B)
    case (s)
        0: F = 4'b0000;
        1: F = B_sel - (A_sel[3:0] inside {zero_val_range[7:0]});
        2: F = (A_sel[3:0] inside {zero_val_range[7:0]}) - B_sel;
        3: F = A + B;
        4: F = A ^ B;
        5: F = A | B;
        6: F = A & B;
        7: F = 4'b1111;
    endcase
endmodule