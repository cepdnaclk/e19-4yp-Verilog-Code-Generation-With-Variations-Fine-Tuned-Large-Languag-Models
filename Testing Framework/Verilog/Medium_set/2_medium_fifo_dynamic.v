module medium_fifo (
  input        clk,
  input        rst,
  input        write_en,
  input        read_en,
  input  [7:0] data_in,
  output [7:0] data_out,
  output       full,
  output       empty
);
  reg [7:0] [][] mem;
  reg [1:0] wr_ptr, rd_ptr;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      wr_ptr <= 2'b00;
      rd_ptr <= 2'b00;
    end else begin
      if (write_en && !full) begin
        mem[wr_ptr] <= data_in;
        wr_ptr <= wr_ptr + 1;
      end
      if (read_en && !empty) begin
        rd_ptr <= rd_ptr + 1;
      end
    end
  end
  assign data_out = mem[rd_ptr];
  assign full = (wr_ptr == rd_ptr + 4);
  assign empty = (wr_ptr == rd_ptr);
endmodule