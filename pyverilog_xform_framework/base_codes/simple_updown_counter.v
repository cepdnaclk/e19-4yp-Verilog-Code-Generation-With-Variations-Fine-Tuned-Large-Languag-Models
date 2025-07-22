module simple_updown_counter (
  input        clk,
  input        rst,
  input        up_down,
  output [7:0] count_out
);
  reg [7:0] count;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      count <= 8'h00;
    end else if (up_down) begin
      count <= count + 1;
    end else begin
      count <= count - 1;
    end
  end
  assign count_out = count;
endmodule