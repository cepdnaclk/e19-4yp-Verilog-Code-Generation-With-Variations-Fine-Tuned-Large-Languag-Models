module simple_mem(address, data_in, data_out, wr_en, rd_en);
input [15:0] address;
input data_in;
output data_out;
output reg [1:0] wr_en, rd_en;
reg [15:0] mem [0:1023];
wire [15:0] mem_wr;
wire [15:0] mem_rd;

assign mem_wr = address;
assign mem_rd = address;

always @(posedge wr_en)
begin
if (wr_en[0])
mem[mem_wr] = data_in;
end

assign data_out = mem[mem_rd];

always @(posedge rd_en) begin
rd_en = rd_en;
end

endmodule