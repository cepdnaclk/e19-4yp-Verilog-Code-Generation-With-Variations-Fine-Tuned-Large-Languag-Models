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
  // Test case for inside operator in if statement
  reg [7:0] test_value;
  reg if_result;
  
  // Example if statement using inside operator
  always @(*) begin
    if (test_value inside {8'd0, 8'd10, 8'd20, 8'd30, 8'd40}) begin
      if_result = 1'b1;
    end else begin
      if_result = 1'b0;
    end
  end
  
  // Nested if with inside operator
  always @(*) begin
    if (buffer[0] inside {8'd0, 8'd1}) begin
      if (buffer[1] inside {8'd2, 8'd3}) begin
        // Nested inside operations
      end
    end
  end

endmodule