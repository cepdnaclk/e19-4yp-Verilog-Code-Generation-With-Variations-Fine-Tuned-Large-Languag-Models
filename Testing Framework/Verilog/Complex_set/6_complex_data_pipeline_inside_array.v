module complex_data_pipeline (
  input        clk,
  input        rst,
  input  [7:0] data_in,
  output [7:0] data_out
);
  reg [7:0] pipeline [0:3];
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      pipeline[0] <= 8'h00;
      pipeline[1] <= 8'h00;
      pipeline[2] <= 8'h00;
      pipeline[3] <= 8'h00;
    end else begin
      pipeline[0] <= data_in;
      pipeline[1] <= pipeline[0] + 1;
      pipeline[2] <= pipeline[1] + 2;
      pipeline[3] <= pipeline[2] + 3;
    end
  end
  assign data_out = pipeline[3];
  // Test case for array slice in inside operator
  wire test_result;
  
  // Example test condition: check if part of the array is inside the range
  assign test_result = (pipeline[2:0] inside {3'b101, 3'b111});

endmodule