```verilog
package cnt_pkg;
reg [3:0] HiCount[10];  // Package-scope array for test bench
endpackage

module comparator #(parameter N=4) (input [N-1:0] A, B, output bit [N-1:0] A_less);
genvar i;
generate 
for (i=0; i < N; i=i+1) begin:loop
    assign A_less[i] = ((A[i] < B[i]) || ((A[i] == B[i]) &&!$isunknown(cnt_pkg::HiCount[i+1])));
end
endgenerate
endmodule

module encoder (BCD_in, Excess_3_out);
import cnt_pkg::HiCount;

input [3:0] BCD_in;
output reg [3:0] Excess_3_out;
wire [3:0] A_less;

comparator #(.N(4)) C0(BCD_in, 4'b1011, A_less);

always @(*) begin
    if (A_less == 4'b1111) begin
        Excess_3_out = 4'b0;
    end else begin
        Excess_3_out = BCD_in + 3;
    end
end
endmodule

module t_encoder();
import cnt_pkg::HiCount;

reg [3:0] BCD_in;
wire [3:0] Excess_3_out;
encoder M0(BCD_in, Excess_3_out);
initial
$monitor($time,,"BCD = %b, Excess-3 Code = %b", BCD_in, Excess_3_out);

initial begin
end

initial begin // Simulation Test Pattern
    HiCount[1] = 1'b1;
    BCD_in = 4'b0001; # 10;
    BCD_in = 4'b0010; # 10;
    BCD_in = 4'b1000; # 1