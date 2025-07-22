```verilog
module t_encoder();
reg [3:0] BCD_in;
wire [3:0] Excess_3_out;

//package-scope array
reg [3:0] HiCount = 3'b001;  
wire [3:0] HiCount_out;

//Inside operator on HiCount
generate
for (HiCount; HiCount <= 2'h6; HiCount = HiCount + 1)
begin
HiCount_out = HiCount;
end
endgenerate

//generate block
generate
for (HiCount = 3'b001; HiCount <= 2'h6; HiCount = HiCount + 1)
begin

assign Excess_3_out = BCD_in + 3'h3;

initial
$monitor($time,,"BCD = %b, Excess-3 Code = %b", BCD_in, Excess_3_out);

initial begin
end
initial begin //Simulation Test Pattern
end
end
endgenerate
endmodule

```
Upvotes: 0