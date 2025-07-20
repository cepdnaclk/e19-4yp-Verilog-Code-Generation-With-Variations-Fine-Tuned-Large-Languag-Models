module counter_with_enable (
  input        clk,
  input        rst,
  output [7:0] count_out
);

  reg [7:0] count;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      count <= 8'h00;
    end else begin
      count <= count + 1;
    end
  end

  assign count_out = count;

endmodule