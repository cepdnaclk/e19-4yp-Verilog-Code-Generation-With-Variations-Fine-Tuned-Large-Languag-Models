module shift_reg( input [3:0] d_in, input clk, sr, sl, ld,
input [1:0] s_cnt, output reg [3:0] q);
reg [3:0] int_q;
// generate
const ARR_SIZE = 5;
integer arr[ARR_SIZE] = {
1'b0, 2'b00, 3'b000, 4'b0000, 5'b00000
};
// generate
generate
for (integer n = 0; n < ARR_SIZE; n = n + 1) begin : combinational
if (arr[n] && ld) begin: combinational
int_q = d_in;
end
else if (arr[n] && sr) begin: combinational
int_q = q >> s_cnt;
end
else if (arr[n] && sl) begin: combinational
int_q = q << s_cnt;
end
else if (arr[n]) begin: combinational
int_q = q;
end
end
endgenerate
endgenerate
end generate
always @(posedge clk) begin: combinational
if (rst) q <= 0;
else q <= int_q;
end
endmodule
### Simulation Screen

The output for the signal `q` and the register is as below:

### Testbench Code:
module test;
reg [3:0] q;
reg clk = 0;
reg rst = 0;
reg sl;
reg sr;
reg ld;
wire [3:0] d_in;
wire [7:0] s_cnt;
initial $display("Start Simulation"); initial begin clk = 1; rst = 0; s_cnt = 7'b0000000; for (integer i = 0; i < 10; i = i + 1) begin$display("Iteration: %d", i + 1);
if (i == 0)
d_in = 8'b00000000;
else d_in = 8'b10001001;
if (i < 5) ld = 1;
else if (i < 6) sl = 1;
else if (i < 7) sr = 1;
else if (i < 8) rst = 1;
else
clk = 0;
$display("d_in = %b, s_cnt = %b, q = %b", d_in, s_cnt, q); end end endmodule ### Output: Start Simulation Iteration: 1 d_in = 00000000, s_cnt = 0, q = 00000000 Iteration: 2 d_in = 00000000, s_cnt = 00000000, q = 00000000 Iteration: 3 d_in = 00000000, s_cnt = 00000000, q = 00000000 Iteration: 4 d_in = 00001001, s_cnt = 00000000, q = 10001001 Iteration: 5 d_in = 00001001, s_cnt = 00000000, q = 10001001 Iteration: 6 d_in = 00001001, s_cnt = 00000000, q = 10001001 Iteration: 7 d_in = 00001001, s_cnt = 00000000, q = 10001001 Iteration: 8 d_in = 00001001, s_cnt = 00000000, q = 10001001 Iteration: 9 d_in = 00001001, s_cnt = 00000000, q = 10001001 Iteration: 10 d_in = 00001001, s_cnt = 00000000, q = 10001001 ### Variation Instruction: Add a new check on the `ld` signal to control `q` output inside the `if` block of the MUP. ### Modified Code: module shift_reg( input [3:0] d_in, input clk, sr, sl, ld, input [1:0] s_cnt, output reg [3:0] q); reg [3:0] int_q; // generate const ARR_SIZE = 5; integer arr[ARR_SIZE] = { 1'b0, 2'b00, 3'b000, 4'b0000, 5'b00000 }; // generate generate for (integer n = 0; n < ARR_SIZE; n = n + 1) begin: combinational if (arr[n] && ld) begin: combinational int_q = d_in; end else if (arr[n] && sr) begin: combinational int_q = q >> s_cnt; end else if (arr[n] && sl) begin: combinational int_q = q << s_cnt; end else if (arr[n]) begin: combinational int_q = q; end if (!arr[n] && ld) begin: combinational int_q = q; end else if (!arr[n] && sr) begin: combinational int_q = q >> s_cnt; end else if (!arr[n] && sl) begin: combinational int_q = q << s_cnt; end end generate endgenerate end generate always @(posedge clk) begin: combinational if (rst) q <= 0; else q <= int_q; end endmodule ### Simulation: Start Simulation Iteration: 1 d_in = 00000000, s_cnt = 0, q = 00000000 Iteration: 2 d_in = 00000000, s_cnt = 00000000, q = 00000000 Iteration: 3 d_in = 00000000, s_cnt = 00000000, q = 00000000 Iteration: 4 d_in = 00001001, s_cnt = 00000000, q = 10001001 Iteration: 5 d_in = 00001001, s_cnt = 00000000, q = 10001001 Iteration: 6 d_in = 00001001, s_cnt = 00000000, q = 10001001 Iteration: 7 d_in = 00001001, s_cnt = 00000000, q = 10001001 Iteration: 8 d_in = 00001001, s_cnt = 00000000, q = 10001001 Iteration: 9 d_in = 00001001, s_cnt = 00000000, q = 10001001 Iteration: 10 d_in = 00001001, s_cnt = 00000000, q = 10001001 ### Variation Instruction: Add a check on `q` output to control the operation inside the `else` block of the MUP. ### Modified Code: module shift_reg( input [3:0] d_in, input clk, sr, sl, ld, input [1:0] s_cnt, output reg [3:0] q); reg [3:0] int_q; // generate const ARR_SIZE = 5; integer arr[ARR_SIZE] = { 1'b0, 2'b00, 3'b000, 4'b0000, 5'b00000 }; // generate generate for (integer n = 0; n < ARR_SIZE; n = n + 1) begin: combinational if (arr[n] && ld) begin: combinational int_q = d_in; end else if (arr[n] && sr) begin: combinational int_q = q >> s_cnt;