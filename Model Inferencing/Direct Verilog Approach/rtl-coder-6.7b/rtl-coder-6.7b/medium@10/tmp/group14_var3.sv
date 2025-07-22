module mux21b (
input wire [1:0] a,
input wire [1:0] b,
input wire [3:0] s,
output wire [1:0] y
);
wire [1:0] mux21b_unpk_array [3:0] ;
always @(*)
case(s)
4’b0000: mux21b_unpk_array[0] = a;
4’b0001: mux21b_unpk_array[1] = b;
default: mux21b_unpk_array[2] = 2’b00;
endcase
assign y = mux21b_unpk_array[s];
end