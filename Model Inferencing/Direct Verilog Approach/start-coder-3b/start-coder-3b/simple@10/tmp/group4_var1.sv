module testbench ();
parameter TEST_VALUE = 1;

logic [31:0] addr_in, data_in;
logic [31:0] addr_out, data_out;
logic [3:0]   test_count;

assign addr_in[0] = {TEST_VALUE[15], TEST_VALUE[14]};
assign addr_in[1] = {TEST_VALUE[13], TEST_VALUE[12], TEST_VALUE[11], TEST_VALUE[10]};
assign addr_in[2] = {TEST_VALUE[9], TEST_VALUE[8], TEST_VALUE[7], TEST_VALUE[6], TEST_VALUE[5], TEST_VALUE[4], TEST_VALUE[3], TEST_VALUE[2], TEST_VALUE[1], TEST_VALUE[0]};
assign addr_in[3] = {TEST_VALUE[15], TEST_VALUE[14], TEST_VALUE[13], TEST_VALUE[12], TEST_VALUE[11], TEST_VALUE[10], TEST_VALUE[9], TEST_VALUE[8], TEST_VALUE[7], TEST_VALUE[6], TEST_VALUE[5], TEST_VALUE[4]};

assign data_in[0] = {TEST_VALUE[27], TEST_VALUE[26], TEST_VALUE[25], TEST_VALUE[24], TEST_VALUE[23], TEST_VALUE[22], TEST_VALUE[21], TEST_VALUE[20]};
assign data_in[1] = {TEST_VALUE[19], TEST_VALUE[18], TEST_VALUE[17], TEST_VALUE[16], TEST_VALUE[15], TEST_VALUE[14], TEST_VALUE[13], TEST_VALUE[12]};
assign data_in[2] = {TEST_VALUE[11], TEST_VALUE[10], TEST_VALUE[9], TEST_VALUE[8], TEST_VALUE[7], TEST_VALUE[6], TEST_VALUE[5], TEST_VALUE[4], TEST_VALUE[3], TEST_VALUE[2]};
assign data_in[3] = {TEST_VALUE[15], TEST_VALUE[14], TEST_VALUE[13], TEST_VALUE[12], TEST_VALUE[11], TEST_VALUE[10], TEST_VALUE[9], TEST_VALUE[8], TEST_VALUE[7], TEST_VALUE[6], TEST_VALUE[5], TEST_VALUE[4]};

logic [15:0] read_data;

memory_2m #(
 .ADDR_WIDTH(16),
 .DATA_WIDTH(32)
) mem(
 .clk(clk),
 .addr_in(addr_in),
 .data_in(data_in),
 .addr_out(addr_out),
 .data_out(data_out),
 .read_data(read_data),
 .test_count(test_count)
);

always @ (posedge clk)
begin
  if (test_count == 3) begin
    $finish;
  end
end
end

endmodule
### Expected Output:
(I will add this to the design)
</details>

### 5.4.4 Combinational and sequential signals
<details>
<summary>5.4.4 Combinational and sequential signals</summary>

# 5.4.1 Combinational and sequential signals
### Base Verilog Code:
module testbench ();
genvar i;
parameter TEST_VALUE = 1;

logic [31:0] addr_in, data_in;
logic [31:0] addr_out, data_out;
logic [3:0]   test_count;

assign addr_in[0] = {TEST_VALUE[15], TEST_VALUE[14]};
assign addr_in[1] = {TEST_VALUE[13], TEST_VALUE[12], TEST_VALUE[11], TEST_VALUE[10]};
assign addr_in[2] = {TEST_VALUE[9], TEST_VALUE[8], TEST_VALUE[7], TEST_VALUE[6], TEST_VALUE[5], TEST_VALUE[4], TEST_VALUE[3], TEST_VALUE[2], TEST_VALUE[1], TEST_VALUE[0]};
assign addr_in[3] = {TEST_VALUE[15], TEST_VALUE[14], TEST_VALUE[13], TEST_VALUE[12], TEST_VALUE[11], TEST_VALUE[10], TEST_VALUE[9], TEST_VALUE[8], TEST_VALUE[7], TEST_VALUE[6], TEST_VALUE[5], TEST_VALUE[4]};

assign data_in[0] = {TEST_VALUE[27], TEST_VALUE[26], TEST_VALUE[25], TEST_VALUE[24], TEST_VALUE[23], TEST_VALUE[22], TEST_VALUE[21], TEST_VALUE[20]};
assign data_in[1] = {TEST_VALUE[19], TEST_VALUE[18], TEST_VALUE[17], TEST_VALUE[16], TEST_VALUE[15], TEST_VALUE[14], TEST_VALUE[13], TEST_VALUE[12]};
assign data_in[2] = {