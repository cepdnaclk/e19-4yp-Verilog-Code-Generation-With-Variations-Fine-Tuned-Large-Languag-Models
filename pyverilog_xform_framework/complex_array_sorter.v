module complex_array_sorter (
  input        clk,
  input        rst,
  input  [7:0] data_in,
  output [7:0] data_out
);
  reg [7:0] array [0:3];
  reg [1:0] index;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      array[0] <= 8'h00;
      array[1] <= 8'h00;
      array[2] <= 8'h00;
      array[3] <= 8'h00;
      index <= 2'b00;
    end else begin
      array[index] <= data_in;
      index <= index + 1;
      if (index == 2'b11 && array[0] > array[1]) begin
        array[0] <= array[1];
        array[1] <= array[0];
      end
    end
  end
  assign data_out = array[0];
endmodule