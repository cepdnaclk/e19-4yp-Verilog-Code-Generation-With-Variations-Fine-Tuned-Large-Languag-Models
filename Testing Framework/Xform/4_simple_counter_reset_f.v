module simple_counter (
  input        clk,
  input        rst,
  input        enable,
  output [7:0] count_out
);

  reg [7:0] count;    

  always @(posedge clk or negedge rst) begin
    if(!rst) begin
      count <= 8'h00;
    end else if (enable) begin
      count <= count + 1;
    end
  end

  assign count_out = count;

endmodule