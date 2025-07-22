module tst_ram();
reg[3:0]wr_addr,rd_addr;
wire[3:0]wr_en;
reg wr_en;
wire[3:0]wr_en_reg;
wire[3:0]wr_en_reg_1;
assign wr_en = wr_en_reg;
wire[3:0]read;
reg[3:0]wr_reg;
wire[3:0]write;
wire[31:0]wr_data,rd_data,wr_data_reg,rd_data_reg;
wire[7:0]rd_en,wr_en_reg,rd_en_reg;
assign rd_en = rd_en_reg;

always @(posedge clk) begin
wr_en = wr_data? 1'b1 : 1'b0;
end

assign write = wr_addr;
assign read = rd_addr;

always @(posedge clk) begin
wr_en_reg = wr_en_reg_1;
wr_data_reg = wr_data;
wr_en_reg_1 = wr_en;
rd_en_reg = rd_en;
rd_en_reg_1 = rd_en;
end

ram r1(write,read,wr_data_reg,rd_data_reg);
endmodule
### Base Verilog Code:
module tst_ram();
reg[3:0]wr_addr,rd_addr;
wire[3:0]wr_en_reg,rd_en_reg;
wire[31:0]wr_data_reg,rd_data