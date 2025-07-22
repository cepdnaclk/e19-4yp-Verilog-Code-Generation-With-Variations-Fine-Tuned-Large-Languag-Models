module encoder (BCD_in, Excess_3_out);
input [3:0] BCD_in;
output [3:0] Excess_3_out;

reg [3:0] adjr;

reg [1:0] HiCount;

wire [1:0] HiCount1;
reg [1:0] HiCount_int;
initial begin
HiCount_int = $urandom;
HiCount = HiCount_int;
end

assign Excess_3_out = HiCount1? BCD_in : BCD_in + 3;

assign HiCount1 = HiCount1? 0 : HiCount1 + 1;

always @(posedge HiCount1)
begin
if (HiCount1 == 0)
begin
HiCount = $urandom;
endif
end
endmodule

module t_encoder();

reg [3:0] BCD_in;
wire [3:0] Excess_3_out;

encoder M0(BCD_in, Excess_3_out);

initial begin
end

initial begin //Simulation Test Pattern
$timescale 1ns / 1ns
$display("HiCount = %b", $urandom);
$display("HiCount = %b", $urandom);
$display("HiCount = %b", $urandom);

end
endmodule

• This kind of question gets better attention when you show the testbench as well. Jan 6 '21 at 19:22
• @Tom Carpenter, added testbench. But there is no test pattern in the testbench. So I don't think that will help much to debug. Jan 7 '21 at 5:37

Do you mean something like:

assign Excess_3_out = (HiCount == 0)? BCD_in : BCD_in + 3;


If you want to avoid the logic using a counter variable, you can do:

assign Excess_3_out = BCD_in ^ (HiCount[0] & 1'b1);


I don't know if it's faster, but it's a bit of a simplification.

Update: to use $urandom, you can do:

assign Excess_3_out = BCD_in ^ (HiCount == 0);


which only uses 1'b1 instead of 2 wires.

I'm not clear on the context of your code, so I'm not sure if this is appropriate for you. But I would generally recommend avoiding counters, and instead to use a truth table for testing, where the input is "randomized" to create a test case.

If you are not using the counter in the test pattern, the module would only be able to receive one input at a time.

Using $urandom can be useful for testing. It is an automatic variable, not like the variables declared in the "initial" section. It is also a variable that is not connected and is not assigned, which is quite useful for initialization. I created the following testbench for you:

module t_encoder();

reg [3:0] BCD_in;
wire [3:0] Excess_3_out;

encoder M0(BCD_in, Excess_3_out);

initial begin
end

initial begin //Simulation Test Pattern
$timescale 1ns / 1ns$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount = %x", $urandom);$display("HiCount =