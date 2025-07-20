module medium_data_buffer (
  input        clk,
  input        rst,
  input        write_en,
  input  [7:0] data_in,
  output [7:0] data_out
);
  reg [7:0] buffer [0:3];
  reg [1:0] ptr;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      ptr <= 2'b00;
    end else if (write_en) begin
      buffer[ptr] <= data_in;
      ptr <= ptr + 1;
    end
  end
  assign data_out = buffer[ptr];
  // Test case for array slice in inside operator
  wire test_result;
  
  // Example test condition: check if part of the array is inside the range
  assign test_result = (buffer[2:0] inside {3'b101, 3'b111});

endmodule