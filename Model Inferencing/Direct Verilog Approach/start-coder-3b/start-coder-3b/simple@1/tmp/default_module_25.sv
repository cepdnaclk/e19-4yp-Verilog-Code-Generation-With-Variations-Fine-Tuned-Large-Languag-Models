#### Testbench:
module test;
int i = 0;
mos_strength a(a, c, zn, zp);
input [7:0] a_in, c_in;
output [7:0] a_out;
reg [7:0] c_out;
reg [7:0] a_out_cmp;
reg [7:0] c_out_cmp;
reg [7:0] z_out;
reg [7:0] p_out;

testbench_bench: begin
c_out = a_in;
c_out_cmp = a_in;

for (i = 0; i < 8; i = i + 1) begin
c_out[i] = 0;
end

for (i = 0; i < 8; i = i + 1) begin
c_out_cmp[i] = 1;
end

for (i = 0; i < 8; i = i + 1) begin
a_out[i] = a_in[i];
end

for (i = 0; i < 8; i = i + 1) begin
if (c_out_cmp[i]!= c_in) begin
a_out[i] = ~a_in[i];
c_out[i] = c_in[i];
end
end

for (i = 0; i < 8; i = i + 1) begin
c_out_cmp[i] = 0;
end

for (i = 0; i < 8; i = i + 1) begin
c_out_cmp[i] = 1;
end

//a_out_cmp = $sign(c_out_cmp); // This only works if you declare a_out_cmp as a logic vector //c_out_cmp = ~c_out_cmp; // This only works if you declare c_out_cmp as a logic vector //a_out_cmp = 0; // This only works if you declare a_out_cmp as a logic vector // c_out_cmp = ~c_out_cmp; // This only works if you declare c_out_cmp as a logic vector // a_out_cmp = 0; // This only works if you declare a_out_cmp as a logic vector a_out_cmp = ~a_out_cmp; // This only works if you declare a_out_cmp as a logic vector // c_out_cmp = 0; // This only works if you declare c_out_cmp as a logic vector a_out_cmp = 1; // This only works if you declare a_out_cmp as a logic vector // c_out_cmp = ~c_out_cmp; // This only works if you declare c_out_cmp as a logic vector // a_out_cmp = 0; // This only works if you declare a_out_cmp as a logic vector // c_out_cmp = 1; // This only works if you declare c_out_cmp as a logic vector// a_out_cmp = 1; // This only works if you declare a_out_cmp as a logic vector //// c_out_cmp = 0; // This only works if you declare c_out_cmp as a logic vector #10; #5; #10; #5; //#10; //#5; //#10; //#5; end // for (j = 0; j < 32; j = j + 1) begin a_in = j; c_in = a_in; a = a_in; c = c_in; //assign zp = zn; //assign zn = 0; #10; //#5; //#10; //#5; //#10; //#5; end #100; endmodule #### Module: module mos_strength ( a, c, zn, zp ); input a, c; output zn, zp; assign zp = ~a; assign zn = a; endmodule #### Top level module: module top; wire a, c; wire zp, zn; module mos_strength (a, c, zn, zp); input [7:0] a_in, c_in; output [7:0] a_out, z_out, p_out; wire [7:0] a_out = 0; wire [7:0] p_out = 0; wire [7:0] z_out = 0; mos_strength a_inst(a_out, a_in, z_out, p_out); endmodule #### Expected Results: c_out = 0, c_out_cmp = 0, a_out_cmp = 0, z_out = 0, p_out = 0 c_out = 0, c_out_cmp = 1, a_out_cmp = 0, z_out = 0, p_out = 0 c_out = 0, c_out_cmp = 2, a_out_cmp = 0, z_out = 0, p_out = 0 c_out = 0, c_out_cmp = 3, a_out_cmp = 0, z_out = 0, p_out = 0 c_out = 0, c_out_cmp = 4, a_out_cmp = 0, z_out = 0, p_out = 0 c_out = 0, c_out_cmp = 5, a_out_cmp = 0, z_out = 0, p_out = 0 c_out = 0, c_out_cmp = 6, a_out_cmp = 0, z_out = 0, p_out = 0 c_out = 0, c_out_cmp = 7, a_out_cmp = 0, z_out = 0, p_out = 0 c_out = 1, c_out_cmp = 0, a_out_cmp = 1, z_out = 1, p_out = 0 c_out = 1, c_out_cmp = 1, a_out_cmp = 1, z_out = 1, p_out = 0 c_out = 1, c_out_cmp = 2, a_out_cmp = 1, z_out = 1, p_out = 0 c_out = 1, c_out_cmp = 3, a_out_cmp = 1, z_out = 1, p_out = 0 c_out = 1, c_out_cmp = 4, a_out_cmp = 1, z_out = 1, p_out = 0 c_out = 1, c_out_cmp = 5, a_out_cmp = 1, z_out = 1, p_out = 0 c_out = 1, c_out_cmp = 6, a_out_cmp = 1, z_out = 1, p_out = 0 c_out = 1, c_out_cmp = 7, a_out_cmp = 1, z_out = 1, p_out = 0 c_out = 2, c_out_cmp = 0, a_out_cmp = 2, z_out = 1, p_out = 0 c_out = 2, c_out_cmp = 1, a_out_cmp = 2, z_out = 1, p_out = 0 c_out = 2, c_out_cmp = 2, a_out_cmp = 2, z_out = 1, p_out = 0 c_out = 2, c_out_cmp = 3, a_out_cmp = 2, z_out = 1, p_out = 0 c_out = 2, c_out_cmp = 4, a_out_cmp = 2, z_out = 1, p_out = 0 c_out = 2, c_out_cmp = 5, a_out_cmp = 2, z_out = 1, p_out = 0 c_out = 2, c_out_cmp = 6, a_out_cmp = 2, z_out = 1, p_out = 0 c_out = 2, c_out_cmp = 7, a_out_cmp = 2, z_out = 1, p_out = 0 c_out = 3, c_out_cmp = 0, a_out_cmp = 3, z_out = 0, p_out = 1 c_out = 3, c_out_cmp = 1, a_out_cmp = 3, z_out = 0,