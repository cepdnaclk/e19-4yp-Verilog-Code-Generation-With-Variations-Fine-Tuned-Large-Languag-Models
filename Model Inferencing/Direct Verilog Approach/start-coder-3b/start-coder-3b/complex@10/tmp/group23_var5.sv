module mux2 (
in1, in2, sel, output reg out
);
reg [1:0] mux2_out[2];
always @( in1, in2, sel ) begin: mux2
mux2_out[1] <= {sel?in1:in2};
mux2_out[0] <= {~sel?in1:in2};
end
assign out = mux2_out[sel];
endmodule
module mux3 (
in1, in2, in3, sel, output reg out
);
reg [2:0] mux3_out[8];
always @( in1, in2, in3, sel ) begin: mux3
mux3_out[7] <= {sel?in1:in2};
mux3_out[6] <= {sel?in1:in2};
mux3_out[5] <= {~sel?in1:in2};
mux3_out[4] <= {sel?in1:in2};
mux3_out[3] <= {sel?in3:in4};
mux3_out[2] <= {sel?in3:in4};
mux3_out[1] <= {sel?in3:in4};
mux3_out[0] <= {~sel?in3:in4};
end
assign out = mux3_out[sel];
endmodule
module mux4 (
in1, in2, in3, in4, sel, output reg out
);
reg [3:0] mux4_out[16];
always @( in1, in2, in3, in4, sel ) begin: mux4
mux4_out[15] <= {sel?in1:in2};
mux4_out[14] <= {sel?in1:in2};
mux4_out[13] <= {sel?in1:in2};
mux4_out[12] <= {sel?in1:in2};
mux4_out[11] <= {sel?in3:in4};
mux4_out[10] <= {sel?in3:in4};
mux4_out[9] <= {sel?in3:in4};
mux4_out[8] <= {sel?in3:in4};
mux4_out[7] <= {sel?in5:in6};
mux4_out[6] <= {sel?in5:in6};
mux4_out[5] <= {sel?in5:in6};
mux4_out[4] <= {sel?in5:in6};
mux4_out[3] <= {~sel?in5:in7};
mux4_out[2] <= {sel?in5:in6};
mux4_out[1] <= {sel?in5:in6};
mux4_out[0] <= {sel?in5:in6};
end
assign out = mux4_out[sel];
endmodule
module mux5 (
in1, in2, in3, in4, in5, sel, output reg out
);
reg [4:0] mux5_out[32];
always @( in1, in2, in3, in4, in5, sel ) begin: mux5
mux5_out[31] <= {sel?in1:in2};
mux5_out[30] <= {sel?in1:in2};
mux5_out[29] <= {sel?in1:in2};
mux5_out[28] <= {sel?in1:in2};
mux5_out[27] <= {sel?in1:in2};
mux5_out[26] <= {sel?in3:in4};
mux5_out[25] <= {sel?in3:in4};
mux5_out[24] <= {sel?in3:in4};
mux5_out[2