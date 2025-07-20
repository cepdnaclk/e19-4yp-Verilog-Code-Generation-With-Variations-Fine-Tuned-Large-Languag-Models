module medium_array_proc (
  input        clk,
  input        rst,
  input  [7:0] data_in,
  output [7:0] sum_out
);
  reg [7:0] [int] data_array;
  reg [2:0] index;
  reg [7:0] sum;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      index <= 3'b000;
      sum <= 8'h00;
    end else begin
      data_array[index] <= data_in;
      index <= index + 1;
      sum <= sum + data_in;
    end
  end
  assign sum_out = sum;
endmodule