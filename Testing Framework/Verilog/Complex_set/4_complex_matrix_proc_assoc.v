module complex_matrix_proc (
  input        clk,
  input        rst,
  input  [7:0] data_in,
  output [7:0] sum_out
);
  reg [7:0] matrix [0:3][0:3];
  reg [1:0] row, col;
  reg [7:0] sum;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      row <= 2'b00;
      col <= 2'b00;
      sum <= 8'h00;
    end else begin
      matrix[row][col] <= data_in;
      sum <= sum + data_in;
      col <= col + 1;
      if (col == 2'b11) row <= row + 1;
    end
  end
  assign sum_out = sum;
endmodule