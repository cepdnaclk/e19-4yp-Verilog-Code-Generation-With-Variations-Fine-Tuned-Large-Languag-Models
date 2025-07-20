module medium_shift_matrix (
  input        clk,
  input        rst,
  input  [3:0] data_in,
  output [3:0] data_out
);
  reg [3:0] matrix [0:3][0:3];
  reg [1:0] row, col;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      row <= 2'b00;
      col <= 2'b00;
    end else begin
      matrix[row][col] <= data_in;
      col <= col + 1;
      if (col == 2'b11) row <= row + 1;
    end
  end
  assign data_out = matrix[3][3];
endmodule