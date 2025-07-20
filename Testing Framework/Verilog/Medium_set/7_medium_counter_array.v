module medium_counter_array (
  input        clk,
  input        rst,
  input  [2:0] select,
  output [7:0] count_out
);
  reg [7:0] counters [0:7];
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      counters[0] <= 8'h00;
      counters[1] <= 8'h00;
      counters[2] <= 8'h00;
      counters[3] <= 8'h00;
      counters[4] <= 8'h00;
      counters[5] <= 8'h00;
      counters[6] <= 8'h00;
      counters[7] <= 8'h00;
    end else begin
      counters[select] <= counters[select] + 1;
    end
  end
  assign count_out = counters[select];
endmodule