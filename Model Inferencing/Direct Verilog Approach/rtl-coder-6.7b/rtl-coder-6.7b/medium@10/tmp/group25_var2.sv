case (idx)
0: out = ({4 {sel[0]}} & x0) | ({4 {sel[1]}} & x1) | ({4 {sel[2]}} & x2);
1: out = ({4 {sel[0]}} & x3) | ({4 {sel[1]}} & x4) | ({4 {sel[2]}} & x5);
2: out = ({4 {sel[0]}} & x6) | ({4 {sel[1]}} & x7) | ({4 {sel[2]}} & x8);
endcase
### Example code:
module example(input [2:0]a, input [3:0]sel, output [7:0]out);
logic [3:0]x0,x1,x2,x3,x4,x5,x6,x7,x8;
always_comb begin
    case (idx)
    0: out = ({4 {sel[0]}} & x0) | ({4 {sel[1]}} & x1) | ({4 {sel[2]}} & x2);
    1: out = ({4 {sel[0]}} & x3) | ({4 {sel[1]}} & x4) | ({4 {sel[2]}} & x5);
    2: out = ({4 {sel[0]}} & x6) | ({4 {sel[1]}} & x7) | ({4 {sel[2]}} & x8);
    endcase
end
endmodule