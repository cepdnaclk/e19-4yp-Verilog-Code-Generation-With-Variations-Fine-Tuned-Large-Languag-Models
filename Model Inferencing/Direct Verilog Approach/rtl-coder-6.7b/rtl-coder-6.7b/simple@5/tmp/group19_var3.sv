// 1. Testcase Inputs
logic [7:0] a_tb, b_tb;
logic [7:0] input_values[0:15];
// 2. Signals
logic Clock, Resetn;
logic [7:0] Sum;
logic [7:0] result_values[0:15];
// 3. Generate Clock & Resetn
always begin
#5 Clock = ~Clock;
end
initial begin
Clock = 1'b0;
Resetn = 1'b0;
end
// 4. Call DUT
test dut(.a(a_tb),.b(b_tb),.Clock(Clock),.Resetn(Resetn),.Sum(Sum));
initial begin
// 5. Resetn
Resetn <= 1'b0;
repeat(2) @(posedge Clock);
Resetn <= 1'b1;
// 6. Testcase Inputs
a_tb <= 8'd0;
b_tb <= 8'd0;
input_values = {8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8,8'd9,8'd10,8'd11,8'd12,8'd13,8'd14,8'd15};
@(posedge Clock);
result_values = {8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8,8'd9,8'd10,8'd11,8'd12,8'd13,8'd14,8'd15};
repeat(15) @(posedge Clock);
@(posedge Clock);
result_values = {8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8,8'd9,8'd10,8'd11,8'd12,8'd13,8'd14,8'd15,8'd0};
repeat(15) @(posedge Clock);
@(posedge Clock);
result_values = {8'd2,8'd4,8'd6,8'd8,8'd10,8'd12,8'd14,8'd16,8'd18,8'd20,8'd22,8'd24,8'd26,8'd28,8'd30,8'd32};
repeat(15) @(posedge Clock);
@(posedge Clock);
result_values = {8'd15,8'd30,8'd45,8'd60,8'd75,8'd90,8'd105,8'd120,8'd135,8'd150,8'd165,8'd180,8'd195,8'd210,8'd225,8'd240};
repeat(15) @(posedge Clock);
@(posedge Clock);
result_values = {8'd30,8'd60,8'd90,8'd120,8'd150,8'd180,8'd210,8'd240,8'd270,8'd300,8'd330,8'd360,8'd390,8'd420,8'd450,8'd480};
repeat(15) @(posedge Clock);
@(posedge Clock);
result_values = {8'd45,8'd90,8'd135,8'd180,8'd225,8'd270,8'd315,8'd360,8'd405,8'd450,8'd495,8'd540,8'd585,8'd630,8'd675,8'd720};
repeat(15) @(posedge Clock);
@(posedge Clock);
result_values = {8'd60,8'd120,8'd180,8'd240,8'd300,8'd360,8'd420,8'd480,8'd540,8'd600,8'd660,8'd720,8'd780,8'd840,8'd900,8'd960};
repeat(15) @(posedge Clock);
@(posedge Clock);
result_values = {8'd75,8'd150,8'd225,8'd300,8'd375,8'd450,8'd525,8'd600,8'd675,8'd750,8'd825,8'd900,8'd975,8'd1050,8'd1125,8'd1200};
repeat(15) @(posedge Clock);
@(posedge Clock);
result_values = {8'd80,8'd160,8'd240,8'd320,8'd400,8'd480,8'd560,8'd640,8'd720,8'd800,8'd880,8'd960,8'd1040,8'd1120,8'd1200,8'd1280};
repeat(15) @(posedge Clock);
@(posedge Clock);
result_values = {8'd85,8'd170,8'd255,8'd340,8'd425,8'd510,8'd595,8'd680,8'd765,8'd850,8'd935,8'd1020,8'd1105,8'd1190,8'd1275,8'd1360};
repeat(15) @(posedge Clock);
@(posedge Clock);
result_values = {8'd90,8'd180,8'd270,8'd360,8'd450,8'd540,8'd630,8'd720,8'd810,8'd900,8'd990,8'd1080,8'd1170,8'd1260,8'd1350,8'd1440};
repeat(15) @(posedge Clock);
@(posedge Clock);
result_values = {8'd95,8'd190,8'd285,8'd380,8'd475,8'd570,8'd665,8'd760,8'd855,8'd950,8'd1045,8'd1140,8'd1235,8'd1330,8'd1425,8'd1520};
repeat(15) @(posedge Clock);
@(posedge Clock);
result_values = {8'd100,8'd200,8'd300,8'd400,8'd500,8'd600,8'd700,8'd800,8'd900,8'd1000,8'd1100,8'd1200,8'd1300,