module test_multiplier ;
reg clk = 0, start, error;
wire [7:0] databus;
wire lsb_out, msb_out, done;
reg [7:0] mem1[0:2], mem2[0:2];
reg [7:0] im_data;
reg [7:0] opnd1, opnd2 ;
reg [15:0] expected_result, multiplier_result;
integer indx;
Multiplier uut ( clk, start, databus, lsb_out, msb_out, done );
initial begin: Apply_Data /*... Figure 8.11...*/
$readmemh ("opnd1.vectors", mem1);
$readmemh ("opnd2.vectors", mem2);
end
initial begin: Apply_Start /*... Figure 8.12...*/
start = 0;
repeat (6) @(posedge clk);
start = 1;
@(posedge clk);
start = 0;
end
initial begin: Expected_Result /*... Figure 8.13...*/
expected_result = 0;
for (indx = 0; indx <= 2; indx = indx + 1) begin
expected_result = mem1[indx] * mem2[indx];
@(posedge clk);
end
end
always @(posedge clk) begin: Actual_Result /*... Figure 8.14...*/
if (done) begin
multiplier_result = {lsb_out, msb_out};
end
end
always @(posedge clk) begin: Compare_Results /*... Figure 8.15...*/
if (done) begin
if (multiplier_result[7:0]!== expected_result[7:0] ||
msb_out!== expected_result[15]) begin
$display("Error Detected.  Actual results: %b.%b Expected results: %b.%b", lsb_out, msb_out, expected_result[7:0],
expected_result[15]);
error = 1;
end
else begin
$display("